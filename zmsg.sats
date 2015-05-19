%{#
#include "zmsg.h"
%}


castfn zmsg_to_ptr {l:addr} (self: !zmsg_t): ptr l

fun zmsg_new (): [l:addr] zmsg_t l = "mac#"
fun zmsg_destroy {l:addr} (self: zmsg_t l): void = "mac#zmsg_destroy_internal"
%{#
	void zmsg_destroy_internal (zmsg_t *self) {
		zmsg_destroy (&self);
	}
%}

fun zmsg_recv (source: !zsock_t): [l:addr] zmsg_t l = "mac#"
fun zmsg_send (self: zmsg_t, dest: !zsock_t): int = "mac#zmsg_send_internal"
%{#
	int zmsg_send_internal (zmsg_t *self, void *dest) {
		int ret = zmsg_send (&self, dest);
		assert (ret == 0);
		return ret;
	}
%}

fun zmsg_size (self: !zmsg_t): size_t = "mac#"
fun zmsg_content_size (self: !zmsg_t): size_t = "mac#"
fun zmsg_prepend (self: !zmsg_t, frame: zframe_t): int = "mac#zmsg_prepend_internal"
%{#
	int zmsg_prepend_internal (zmsg_t *self, zframe_t *frame) {
		int ret = zmsg_prepend (self, &frame);
		assert (ret == 0);
		return ret;
	}
%}

fun zmsg_append (self: !zmsg_t, frame: zframe_t): int = "mac#zmsg_append_internal"
%{#
	int zmsg_append_internal (zmsg_t *self, zframe_t *frame) {
		int ret = zmsg_append (self, &frame);
		assert (ret == 0);
		return ret;
	}
%}

fun zmsg_prepend (self: !zmsg_t, frame: zframe_t): int = "mac#zmsg_prepend_internal"
%{#
	int zmsg_prepend_internal (zmsg_t *self, zframe_t *frame) {
		int ret = zmsg_prepend (self, &frame);
		assert (ret == 0);
		return ret;
	}
%}

fun zmsg_pop (self: !zmsg_t): [m:addr] zframe_t m = "mac#"
fun zmsg_pushmem {m:addr} (self: !zmsg_t, src: ptr m, size: size_t): int = "mac#zmsg_pushmem_internal"
%{#
	int zmsg_pushmem_internal (zmsg_t *self, const void *src, size_t size) {
		int ret = zmsg_pushmem (self, src, size);
		assert (ret == 0);
		return ret;
	}
%}

fun zmsg_addmem {m:addr} (self: !zmsg_t, src: ptr m, size: size_t): int = "mac#zmsg_addmem_internal"
%{#
	int zmsg_addmem_internal (zmsg_t *self, const void *src, size_t size) {
		int ret = zmsg_addmem (self, src, size);
		assert (ret == 0);
		return ret;
	}
%}

fun zmsg_pushstr (self: !zmsg_t, string: string): int = "mac#zmsg_pushstr_internal"
%{#
	int zmsg_pushstr_internal (zmsg_t *self, const char *string) {
		int ret = zmsg_pushstr (self, string);
		assert (ret == 0);
		return ret;
	}
%}

fun zmsg_addstr (self: !zmsg_t, string: string): int = "mac#zmsg_addstr_internal"
%{#
	int zmsg_addstr_internal (zmsg_t *self, const char *string) {
		int ret = zmsg_addstr (self, string);
		assert (ret == 0);
		return ret;
	}
%}

(* better check return value in C *)
fun zmsg_pushstrf {ts:types} (self: !zmsg_t, format: string, args: ts): int = "mac#"
fun zmsg_addstrf {ts:types} (self: !zmsg_t, format: string, args: ts): int = "mac#"

fun zmsg_popstr (self: !zmsg_t): [m:addr] zstr_t m = "mac#"

fun zmsg_addmsg (self: !zmsg_t, msg: zmsg_t): int = "mac#zmsg_addmsg_internal"
%{#
	int zmsg_addmsg_internal (zmsg_t *self, zmsg_t *msg) {
		int ret = zmsg_addmsg (self, &msg);
		assert (ret == 0);
		return ret;
	}
%}

fun zmsg_popmsg (self: !zmsg_t): [m:addr] zmsg_t m = "mac#"

(* these are not good ideas *)
fun zmsg_remove (self: !zmsg_t, frame: !zframe_t): void = "mac#"
fun zmsg_first (self: !zmsg_t): [m:addr] zframe_t m = "mac#"
fun zmsg_next (self: !zmsg_t): [m:addr] zframe_t m = "mac#"
fun zmsg_last (self: !zmsg_t): [m:addr] zframe_t m = "mac#"

fun zmsg_save (self: !zmsg_t, file: FILEref): int = "mac#zmsg_save_internal"
%{#
	int zmsg_save_internal (zmsg_t *self, FILE *file) {
		int ret = zmsg_save (self, file);
		assert (ret == 0);
		return ret;
	}
%}

fun zmsg_load (self: !zmsg_t, file: FILEref): int = "mac#zmsg_load_internal"
%{#
	int zmsg_load_internal (zmsg_t *self, FILE *file) {
		int ret = zmsg_load (self, file);
		assert (ret == 0);
		return ret;
	}
%}

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