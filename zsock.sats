castfn zsock_to_ptr {l:addr} (self: !zsock_t l): ptr l

fun zsock_new (type: zsocktype): [l:addr] zsock_t l = "mac#"

(* 
 * this is different from original definition 
 * since linear type can guarentee "linear" already.
 * we don't need to reset the pointer to NULL as in C.
 *)
fun zsock_destroy {l:addr} (self: zsock_t l): void = "mac#zsock_destroy_internal"

fun zsock_new_sub    (endpoint: string, subscribe: string): [l:addr] zsock_t l = "mac#"
fun zsock_new_pub    (endpoint: string): [l:addr] zsock_t l                    = "mac#"
fun zsock_new_req    (endpoint: string): [l:addr] zsock_t l                    = "mac#"
fun zsock_new_rep    (endpoint: string): [l:addr] zsock_t l                    = "mac#"
fun zsock_new_dealer (endpoint: string): [l:addr] zsock_t l                    = "mac#"
fun zsock_new_router (endpoint: string): [l:addr] zsock_t l                    = "mac#"
fun zsock_new_push   (endpoint: string): [l:addr] zsock_t l                    = "mac#"
fun zsock_new_pull   (endpoint: string): [l:addr] zsock_t l                    = "mac#"
fun zsock_new_xpub   (endpoint: string): [l:addr] zsock_t l                    = "mac#"
fun zsock_new_xsub   (endpoint: string): [l:addr] zsock_t l                    = "mac#"
fun zsock_new_pair   (endpoint: string): [l:addr] zsock_t l                    = "mac#"
fun zsock_new_stream (endpoint: string): [l:addr] zsock_t l                    = "mac#"


fun zsock_bind (self: !zsock_t, format: string): int = "mac#" // should check return value
fun zsock_endpoint (self: !zsock_t): string = "mac#"
fun zsock_unbind (self: !zsock_t, format: string): int = "mac#" // should check return value
fun zsock_connect (self: !zsock_t, format: string): int = "mac#" // should check return value
fun zsock_disconnect (self: !zsock_t, format: string): int = "mac#" // should check return value
fun zsock_attach (self: !zsock_t, endpoints: string, serverish: bool): int = "mac#" // should check return value
fun zsock_type_str (self: !zsock_t): string = "mac#"
//fun zsock_send {ts:types} (self: !zsock_t, picture: string, args: ts): int = "mac#zsock_send_internal"
//fun zsock_recv {ts:types} (self: !zsock_t, picture: string, args: ts): int = "mac#zsock_recv_internal"
//fun zsock_bsend {ts:types} (self: !zsock_t, picture: string, args: ts): int = "mac#zsock_bsend_internal"
//fun zsock_brecv {ts:types} (self: !zsock_t, picture: string, args: ts): int = "mac#zsock_brecv_internal"
fun zsock_set_unbounded (self: !zsock_t): void = "mac#"
fun zsock_signal (self: !zsock_t, status: byte): int = "mac#zsock_signal_internal"
fun zsock_wait (self: !zsock_t): int = "mac#zsock_wait_internal"
fun zsock_flush (self: !zsock_t): void = "mac#"

(* zsock_is and zsock_resolve are not needed *)

(* should be reimplemented in ats *)
fun zsock_test (verbose: bool): void