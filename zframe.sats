%{#
#include "zframe.h"
%}

castfn zframe_to_ptr {l:addr} (self: !zframe_t l): ptr l

macdef ZFRAME_MORE = $extval (int, "ZFRAME_MORE")
macdef ZFRAME_REUSE = $extval (int, "ZFRAME_REUSE")
macdef ZFRAME_DONTWAIT = $extval (int, "ZFRAME_DONTWAIT")

fun zframe_new {l:addr} (data: ptr l, size: size_t): [m:addr] zframe_t m = "mac#"
fun zframe_destroy {l:addr} (self: zframe_t l): void = "mac#zframe_destroy_internal"
%{#
	void zframe_destroy_internal (zframe_t *self) {
		zframe_destroy (&self);
	}
%}

fun zframe_new_empty (): [l:addr] zframe_t l = "mac#"
fun zframe_recv (source: !zsock_t): [l:addr] zframe_t l = "mac#"

fun zframe_send (self: zframe_t, dest: !zsock_t, flags: int): int = "mac#zframe_send_internal"
%{#
	int zframe_send_internal (zframe_t *self, void *dest, int flags) {
		int ret = zframe_send (&self, dest, flags);
		assert (ret == 0);
		return ret;
	}
%}

fun zframe_size (self: !zframe_t): size_t = "mac#"

(* unsafe *)
fun zframe_data  (self: !zframe_t): [m:addr|m>null] ptr m = "mac#"

fun zframe_dup (self: !zframe_t): [m:addr] zframe_t m = "mac#"
fun zframe_strhex (self: !zframe_t): [m:addr] zstr_t m  = "mac#"
fun zframe_strdup (self: !zframe_t): [m:addr] zstr_t m  = "mac#"
fun zframe_streq (self: !zframe_t, string: string): bool = "mac#"
fun zframe_more (self: !zframe_t): bool = "mac#zframe_more_internal"
%{#
	int zframe_more_internal (zframe_t *self) {
		return zframe_more (self) == ZFRAME_MORE;
	}
%}

fun zframe_set_more (self: !zframe_t, more: bool): void = "mac#zframe_set_more_internal"
%{#
	void zframe_set_more_internal (zframe_t *self, int more) {
		if (more == 0) {
			zframe_set_more (self, ZFRAME_MORE);
		} else {
			zframe_set_more (self, 0);
		}
	}
%}

fun zframe_eq (self: !zframe_t, other: !zframe_t): bool = "mac#"
fun zframe_reset {l:addr} (self: !zframe_t, data: ptr l, size: size_t): void = "mac#"
fun zframe_print (self: !zframe_t, pfix: string): void = "mac#"

(* zframe_is is not used *)

(* should be implemented in ATS *)
fun zframe_test (verbose: bool): void