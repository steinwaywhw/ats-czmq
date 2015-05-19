%{#
#include "zsock.h"
%}

castfn zsock_to_ptr {l:addr} (self: !zsock_t l): ptr l




fun zsock_new (type: zsocktype): [l:addr] zsock_t l = "mac#"

(* 
 * this is different from original definition 
 * since linear type can guarentee "linear" already.
 * we don't need to reset the pointer to NULL as in C.
 *)
fun zsock_destroy {l:addr} (self: zsock_t l): void = "mac#zsock_destroy_internal"
%{#
	void zsock_destroy_internal (zsock_t *self) {
		zsock_destroy (&self);
	}
%}

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

(*  better use zsock_bind_internal to match "mac#", 
 *	and use zsock_bind with assert ret >= 0 
 *)
fun zsock_bind {ts:types} (self: !zsock_t, format: string, args: ts): int = "mac#"

fun zsock_endpoint (self: !zsock_t): string

(* same with zsock_bind *)
fun zsock_unbind {ts:types} (self: !zsock_t, format: string, args: ts): int = "mac#"

(* same with zsock_bind *)
fun zsock_connect {ts:types} (self: !zsock_t, format: string, args: ts): int = "mac#"

(* same with zsock_bind *)
fun zsock_disconnect {ts:types} (self: !zsock_t, format: string, args: ts): int = "mac#"

(* same with zsock_bind *)
fun zsock_attach (self: !zsock_t, endpoints: string, serverish: bool): int = "mac#"

fun zsock_type_str (self: !zsock_t): string

fun zsock_send {ts:types} (self: !zsock_t, picture: string, args: ts): int = "mac#zsock_send_internal"
%{#
	int zsock_send_internal (void *self, const char *picture, ...) {
		va_list args;
		va_start (args, picture);
		int ret = zsock_vsend (self, picture, args);
		va_end (args);

		assert (ret == 0);
		return ret;
	}
%}


fun zsock_recv {ts:types} (self: !zsock_t, picture: string, args: ts): int = "mac#zsock_recv_internal"
%{#
	int zsock_recv_internal (void *self, const char *picture, ...) {
		va_list args;
		va_start (args, picture);
		int ret = zsock_vrecv (self, picture, args);
		va_end (args);

		assert (ret == 0);
		return ret;
	}
%}

fun zsock_bsend {ts:types} (self: !zsock_t, picture: string, args: ts): int = "mac#zsock_bsend_internal"
%{#
	int zsock_bsend_internal (void *self, const char *picture, ...) {
		va_list args;
		va_start (args, picture);
		int ret = zsock_vbsend (self, picture, args);
		va_end (args);

		assert (ret == 0);
		return ret;
	}
%}

fun zsock_brecv {ts:types} (self: !zsock_t, picture: string, args: ts): int = "mac#zsock_brecv_internal"
%{#
	int zsock_brecv_internal (void *self, const char *picture, ...) {
		va_list args;
		va_start (args, picture);
		int ret = zsock_vbrecv (self, picture, args);
		va_end (args);

		assert (ret == 0);
		return ret;
	}
%}

fun zsock_set_unbounded (self: !zsock_t): void = "mac#"

fun zsock_signal (self: !zsock_t, status: int8): int = "mac#zsock_signal_internal"
%{#
	int zsock_signal_internal (void *self, byte status) {
		int ret = zsock_signal (self, status);
		assert (ret == 0);
		return ret;
	}
%}

fun zsock_wait (self: !zsock_t): int = "mac#zsock_wait_internal"
%{#
	int zsock_wait_internal (void *self) {
		int ret = zsock_wait (self);
		assert (ret >= 0);
		return ret;
	}
%}

fun zsock_flush (self: !zsock_t): void = "mac#"

(* zsock_is and zsock_resolve are not needed *)

(* should be reimplemented in ats *)
fun zsock_test (verbose: bool): void