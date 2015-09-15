
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
fun zmsg_pushstrf {ts:types} (self: !zmsg_t, format: string, args: ts): int = "mac#"
fun zmsg_addstrf {ts:types} (self: !zmsg_t, format: string, args: ts): int = "mac#"

fun zmsg_popstr (self: !zmsg_t): [m:addr] zstr_t m = "mac#"
fun zmsg_addmsg (self: !zmsg_t, msg: zmsg_t): int = "mac#zmsg_addmsg_internal"
fun zmsg_popmsg (self: !zmsg_t): [m:addr] zmsg_t m = "mac#"

(* these are not good ideas *)
fun zmsg_remove (self: !zmsg_t, frame: !zframe_t): void = "mac#"
fun zmsg_first (self: !zmsg_t): [m:addr] zframe_t m = "mac#"
fun zmsg_next (self: !zmsg_t): [m:addr] zframe_t m = "mac#"
fun zmsg_last (self: !zmsg_t): [m:addr] zframe_t m = "mac#"

fun zmsg_save (self: !zmsg_t, file: FILEref): int = "mac#zmsg_save_internal"
fun zmsg_load (self: !zmsg_t, file: FILEref): int = "mac#zmsg_load_internal"

(* not sure of encode *)
fun zmsg_encode {m:addr} (self: !zmsg_t, buffer: &(ptr m)? >> _): size_t = "mac#zmsg_encode_internal"
fun zmsg_decode {l:addr|l>null} (buffer: ptr l, size: size_t): [m:addr] zmsg_t m = "mac#"

fun zmsg_dup (self: !zmsg_t): [m:addr] zmsg_t m = "mac#"
fun zmsg_print (self: !zmsg_t): void = "mac#"
fun zmsg_eq (self: !zmsg_t, other: !zmsg_t): bool = "mac#"
fun zmsg_new_signal (status: byte): [m:addr] zmsg_t m = "mac#"
fun zmsg_signal (self: !zmsg_t): byte = "mac#"

(* zmsg_is is not needed *)

(* need to implement in ATS *)
fun zmsg_test (verbose: bool): void