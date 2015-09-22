#include "share/atspre_staload.hats"
staload "prelude/SATS/char.sats"

staload "czmq.sats"

local (* local-in-end *)

symintr show 
overload show with print_string
overload show with print_newline
overload show with print_int 
overload show with print_char

overload ptrcast with string2ptr 
overload ptrcast with zsock_to_ptr 
overload ptrcast with zmsg_to_ptr 
overload ptrcast with zframe_to_ptr 

#define NULL the_null_ptr

staload UN = "prelude/SATS/unsafe.sats"
staload "libc/SATS/stdio.sats"

in (* local-in-end *)

implement zmsg_foreach (self, f) = let 

	viewdef addback_t (n:addr) = (!zmsg_takeout_t >> zmsg_t, zframe_t n) -<lin,prf> void

	val (addback|first) = zmsg_first self

	fun loop {n:addr} (addback: addback_t n | self: !zmsg_takeout_t >> zmsg_t , frame: zframe_t n, f: (!zframe_t n >> zframe_t n) -<cloref1> void):<cloref1> void =
		if ptrcast frame = 0 
		then 
			(* directly add back to zmsg *) 
			let prval () = addback (self, frame) in () end
		else 
			(* call f before add back to zmsg *)
			let 
				val _ = assert (ptrcast frame > 0)
				val _ = f frame 
				prval _ = addback (self, frame)
				val (addback|next) = zmsg_next self
			in 
				loop (addback|self, next, f)
			end  
in 
	loop (addback|self, first, f)
end

implement zmsg_test (verbose) = () where {
	val _ = show " * zmsg: "

	val output = zsock_new_pair "@inproc://zmsg.test"
	val _ = assert (ptrcast output > 0)
	val input = zsock_new_pair ">inproc://zmsg.test"
	val _ = assert (ptrcast input > 0)

	val msg = zmsg_new ()
	val _ = assert (ptrcast msg > 0)
	val frame = zframe_new (string2ptr "Hello", i2sz 5)
	val _ = assert (ptrcast frame > 0)
	val _ = zmsg_prepend (msg, frame)
	val _ = assert (zmsg_size msg = 1)
	val _ = assert (zmsg_content_size msg = 5)
	val rc = zmsg_send (msg, output)
	val _ = assert (rc = 0)

	val msg = zmsg_recv input
	val _ = assert (ptrcast msg > 0)

	val _ = assert (zmsg_addmem (msg, string2ptr "Frame0", i2sz 6) = 0)
	val _ = assert (zmsg_addmem (msg, string2ptr "Frame1", i2sz 6) = 0)
	val _ = assert (zmsg_addmem (msg, string2ptr "Frame2", i2sz 6) = 0)
	val _ = assert (zmsg_addmem (msg, string2ptr "Frame3", i2sz 6) = 0)
	val _ = assert (zmsg_addmem (msg, string2ptr "Frame4", i2sz 6) = 0)
	val _ = assert (zmsg_addmem (msg, string2ptr "Frame5", i2sz 6) = 0)
	val _ = assert (zmsg_addmem (msg, string2ptr "Frame6", i2sz 6) = 0)
	val _ = assert (zmsg_addmem (msg, string2ptr "Frame7", i2sz 6) = 0)
	val _ = assert (zmsg_addmem (msg, string2ptr "Frame8", i2sz 6) = 0)
	val _ = assert (zmsg_addmem (msg, string2ptr "Frame9", i2sz 6) = 0)

	val copy = zmsg_dup msg
	val _ = assert (ptrcast copy > 0)
	val _ = assert (zmsg_send (copy, output) = 0)
	val _ = assert (zmsg_send (msg, output) = 0)

	val copy = zmsg_recv input
	val _ = assert (ptrcast copy > 0)
	val _ = assert (zmsg_size copy = 10)
	val _ = assert (zmsg_content_size copy = 60)
	val _ = zmsg_destroy copy 

	val msg = zmsg_recv input
	val _ = assert (ptrcast msg > 0)
	val _ = assert (zmsg_size msg = 10)
	val _ = assert (zmsg_content_size msg = 60)

	#define fopen fopen_ref_exn

	val file = fopen ("zmsg.test", file_mode_w)
	val _ = fclose file

	val file = fopen ("zmsg.test", file_mode_r)
	val null_msg = zmsg_load (file)
	val _ = assert (ptrcast null_msg = 0)
	val _ = fclose file 
	val _ = remove "zmsg.test"
	val _ = zmsg_destroy null_msg

	val file = fopen ("zmsg.test", file_mode_w)
	val _ = assert (zmsg_save (msg, file) = 0)
	val _ = fclose file 

//	val file = fopen ("zmsg.test", file_mode_r)
//	val _ = assert (zmsg_save (msg, file) = ~1)
	val _ = zmsg_destroy msg

	val file = fopen ("zmsg.test", file_mode_r)
	val msg = zmsg_load file 
	val _ = assert (ptrcast msg > 0)
	val _ = fclose file 
	val _ = remove "zmsg.test"
	val _ = assert (zmsg_size msg = 10)
	val _ = assert (zmsg_content_size msg = 60)

	fun loop (msg: !zmsg_t, x: int): void = 
		if x < 9 
		then 
			let 
				val frame = zmsg_remove (msg, x) 
				val _ = zframe_destroy frame
			in 
				loop (msg, x+1) 
			end
		else loop (msg, x+1)

	val _ = loop (msg, 1) 

	val _ = assert (zmsg_size msg = 2)
	val (addback | frame) = zmsg_last msg
	val _ = assert (zframe_streq (frame, "Frame9"))
	prval _ = addback (msg, frame)
	val _ = assert (zmsg_content_size msg = 12)

	val frame = zframe_new (string2ptr "Address", i2sz 7)
	val _ = assert (ptrcast frame > 0)
	val _ = zmsg_prepend (msg, frame)
	val _ = assert (zmsg_size msg = 3)

	val rc = zmsg_addstr (msg, "Body")
	val _ = assert (rc = 0)
	val _ = assert (zmsg_size msg = 4)

	val frame = zmsg_pop msg
	val _ = zframe_destroy frame 
	val _ = assert (zmsg_size msg = 3)

	val body = zmsg_popstr msg 
	val _ = assert (zstr_to_string body = "Frame0")
	val _ = zstr_free body
	val _ = zmsg_destroy msg 

	val msg = zmsg_new ()
	val _ = assert (ptrcast msg > 0)
	val (pf|blank) = zmalloc (i2sz 100000)
	val _ = assert (blank > 0)
	val rc = zmsg_addmem (msg, blank, i2sz 0)
    val _ = assert (rc = 0)
    val rc = zmsg_addmem (msg, blank, i2sz 1)
    val _ = assert (rc = 0)
    val rc = zmsg_addmem (msg, blank, i2sz 253)
    val _ = assert (rc = 0)
    val rc = zmsg_addmem (msg, blank, i2sz 254)
    val _ = assert (rc = 0)
    val rc = zmsg_addmem (msg, blank, i2sz 255)
    val _ = assert (rc = 0)
    val rc = zmsg_addmem (msg, blank, i2sz 256)
    val _ = assert (rc = 0)
    val rc = zmsg_addmem (msg, blank, i2sz 65535)
    val _ = assert (rc = 0)
    val rc = zmsg_addmem (msg, blank, i2sz 65536)
    val _ = assert (rc = 0)
    val rc = zmsg_addmem (msg, blank, i2sz 65537)
    val _ = assert (rc = 0)
    val _ = zfree (pf | blank)
    val _ = assert (zmsg_size msg = 9)
    var buffer = NULL 
    val (pf | buffer_size) = zmsg_encode (msg, buffer)
    val _ = zmsg_destroy msg
    val msg = zmsg_decode (buffer, buffer_size)
    val _ = assert (ptrcast msg > 0)
    val _ = zfree (pf | buffer)
    val _ = zmsg_destroy msg 

    val msg = zmsg_new ()
    val _ = assert (ptrcast msg > 0)
    val submsg = zmsg_new ()
    val _ = zmsg_pushstr (msg, "matr")
    val _ = zmsg_pushstr (submsg, "joska")
    val rc = zmsg_addmsg (msg, submsg)
    val _ = assert (rc = 0)
    val submsg = zmsg_popmsg msg
    val _ = assert (ptrcast submsg = 0)
    val _ = zmsg_destroy submsg
    val submsg = zmsg_popmsg msg
    val _ = assert (ptrcast submsg > 0)
    val body = zmsg_popstr submsg
    val _ = assert (zstr_to_string body = "joska")
    val _ = zstr_free body
    val _ = zmsg_destroy submsg
    val frame = zmsg_pop msg
    val _ = assert (ptrcast frame = 0)
    val _ = zframe_destroy frame
    val _ = zmsg_destroy msg

    val msg = zmsg_new ()
    val _ = assert (ptrcast msg > 0)
    val _ = zmsg_addstr (msg, "One")
    val _ = zmsg_addstr (msg, "Two")
    val _ = zmsg_addstr (msg, "Three")
    val msg_other = zmsg_new ()
    val _ = assert (ptrcast msg_other > 0)
    val _ = zmsg_addstr (msg_other, "One")
    val _ = zmsg_addstr (msg_other, "Two")
    val _ = zmsg_addstr (msg_other, "One-Hundred")
    val msg_dup = zmsg_dup (msg)
    val _ = assert (ptrcast msg_dup > 0)
    val empty_msg = zmsg_new ()
    val empty_msg_2 = zmsg_new ()
    val _ = assert (zmsg_eq (msg, msg_dup))
    val _ = assert (~zmsg_eq (msg, msg_other))
    val _ = assert (zmsg_eq (empty_msg, empty_msg_2))
//    val _ = assert (~zmsg_eq (msg, NULL))
//    val _ = assert (~zmsg_eq (NULL, empty_msg))
//    val _ = assert (~zmsg_eq (NULL, NULL))
    val _ = zmsg_destroy msg
    val _ = zmsg_destroy msg_other
    val _ = zmsg_destroy msg_dup
    val _ = zmsg_destroy empty_msg
    val _ = zmsg_destroy empty_msg_2


    #define byte2i byte2int0 

    val msg = zmsg_new_signal (i2byte 0x00)
    val _ = assert (byte2i (zmsg_signal msg) = 0x00)
    val _ = zmsg_destroy msg
    val msg = zmsg_new_signal (i2byte ~0x01)
    val _ = assert (byte2i (zmsg_signal msg) = 0xFF)
    val _ = zmsg_destroy msg

//    val msg = zmsg_new ();
//    val _ = assert (ptrcast msg > 0)
//    val _ = assert (zmsg_size msg = 0)
//    val _ = assert (zmsg_first (msg) = NULL)
//    val _ = assert (zmsg_last (msg) = NULL)
//    val _ = assert (zmsg_next (msg) = NULL)
//    val _ = assert (zmsg_pop (msg) = NULL)
//    val _ = assert (zmsg_send (&msg, output) = 0)
//    val _ = assert (!msg)

    val _ = zsock_destroy input
    val _ = zsock_destroy output

    //  @end
    val _ = show "OK\n"
}


end (* local-in-end *)