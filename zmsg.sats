
castfn zmsg_to_ptr {l:addr} (self: !zmsg_t l): ptr l

fun zmsg_new (): [l:addr] zmsg_t l = "mac#"
fun zmsg_destroy {l:addr} (self: zmsg_t l): void = "mac#zmsg_destroy_internal"
fun zmsg_recv (source: !zsock_t): [l:addr] zmsg_t l = "mac#"
fun zmsg_send (self: zmsg_t, dest: !zsock_t): int = "mac#zmsg_send_internal"
fun zmsg_size (self: !zmsg_t): size_t = "mac#"
fun zmsg_content_size (self: !zmsg_t): size_t = "mac#"
fun zmsg_prepend (self: !zmsg_t, frame: zframe_t): int = "mac#zmsg_prepend_internal"
fun zmsg_append (self: !zmsg_t, frame: zframe_t): int = "mac#zmsg_append_internal"
fun zmsg_pop (self: !zmsg_t): [m:addr] zframe_t m = "mac#"
fun zmsg_pushmem {m:addr} (self: !zmsg_t, src: ptr m, size: size_t): int = "mac#zmsg_pushmem_internal"
fun zmsg_addmem {m:addr} (self: !zmsg_t, src: ptr m, size: size_t): int = "mac#zmsg_addmem_internal"
fun zmsg_pushstr (self: !zmsg_t, string: string): int = "mac#zmsg_pushstr_internal"
fun zmsg_addstr (self: !zmsg_t, string: string): int = "mac#zmsg_addstr_internal"

(* better check return value in C *)
fun zmsg_pushstrf (self: !zmsg_t, format: string): int = "mac#"
fun zmsg_addstrf (self: !zmsg_t, format: string): int = "mac#"

fun zmsg_popstr (self: !zmsg_t): [m:addr] zstr_t m = "mac#"
fun zmsg_addmsg (self: !zmsg_t, msg: zmsg_t): int = "mac#zmsg_addmsg_internal"
fun zmsg_popmsg (self: !zmsg_t): [m:addr] zmsg_t m = "mac#"

(* different from original api. this removes a frame from the message, or null if out of bound *)
fun zmsg_remove (self: !zmsg_t, index: int): [m:addr] zframe_t m = "mac#zmsg_remove_internal"
%{#
	zframe_t * zmsg_remove_internal (zmsg_t *self, int index) {
		assert (self);
		assert (zmsg_is (self));

		if (index >= zmsg_size (self) || index < 0) {
			return NULL;
		} else {
			zframe_t *frame = zmsg_first (self);
			while (index > 0) {
				frame = zmsg_next (self);
				index--;
			}

			zmsg_remove (self, frame);
			return frame;
		}
	}
%}

(* foreach *)
(* need to be done in ATS *)
fun zmsg_foreach {m:addr|m>null} (self: !zmsg_t, (!zframe_t m >> zframe_t m) -<cloref1> void): void 

(* get a copy of the first frame *)
absvtype zmsg_takeout_t = ptr 
fun zmsg_first (self: !zmsg_t >> zmsg_takeout_t): [m:addr] ((!zmsg_takeout_t >> zmsg_t, zframe_t m) -<lin,prf> void | zframe_t m) = "mac#"
fun zmsg_next  (self: !zmsg_t >> zmsg_takeout_t): [m:addr] ((!zmsg_takeout_t >> zmsg_t, zframe_t m) -<lin,prf> void | zframe_t m) = "mac#"
fun zmsg_last  (self: !zmsg_t >> zmsg_takeout_t): [m:addr] ((!zmsg_takeout_t >> zmsg_t, zframe_t m) -<lin,prf> void | zframe_t m) = "mac#"

fun zmsg_save (self: !zmsg_t, file: FILEref): int = "mac#zmsg_save_internal"
%{#
	int zmsg_save_internal (zmsg_t *self, FILE *file) {
		int ret = zmsg_save (self, file);
		assert (ret == 0);
		return ret;
	}
%}

symintr zmsg_load 
fun zmsg_load_0 (file: FILEref): [m:addr] zmsg_t m = "mac#zmsg_load_internal"
%{#
	zmsg_t * zmsg_load_internal (FILE *file) {
		return zmsg_load (NULL, file);
	}
%}
fun zmsg_load_1 (self: zmsg_t, file: FILEref): [m:addr] zmsg_t m = "mac#"
overload zmsg_load with zmsg_load_0 
overload zmsg_load with zmsg_load_1



(* not sure of encode *)
fun zmsg_encode (self: !zmsg_t, buffer: &ptr? >> ptr l): #[l:addr;n:nat|l>null] (@[byte][n] @ l | size_t n) = "mac#"
fun zmsg_decode {l:addr|l>null} (buffer: ptr l, size: size_t): [m:addr] zmsg_t m = "mac#"

fun zmsg_dup (self: !zmsg_t): [m:addr] zmsg_t m = "mac#"
fun zmsg_print (self: !zmsg_t): void = "mac#"
fun zmsg_eq {m,n:addr} (self: !zmsg_t m, other: !zmsg_t n): bool = "mac#"
fun zmsg_new_signal (status: byte): [m:addr] zmsg_t m = "mac#"
fun zmsg_signal (self: !zmsg_t): byte = "mac#"

(* zmsg_is is not needed *)

(* need to implement in ATS *)
fun zmsg_test (verbose: bool): void

