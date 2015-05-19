%{#
#include "zstr.h"
%}

castfn zstr_to_ptr {m:addr} (self: !zstr_t m): ptr m
castfn zstr_to_string (self: !zstr_t): string

fun zstr_recv (source: !zsock_t): [m:addr] zstr_t m = "mac#"
fun zstr_send (dest: !zsock_t, string: string): int = "mac#zstr_send_internal"
%{#
    int zstr_send_internal (void *dest, const char *string) {
        int ret = zstr_send (dest, string);
        assert (ret == 0);
        return ret;
    }
%}

fun zstr_sendm (dest: !zsock_t, string: string): int = "mac#zstr_sendm_internal"
%{#
    int zstr_sendm_internal (void *dest, const char *string) {
        int ret = zstr_sendm (dest, string);
        assert (ret == 0);
        return ret;
    }
%}

(* better check return value *)
fun zstr_sendf {ts:types} (dest: !zsock_t, format: string, args: ts): int = "mac#"
fun zstr_sendfm {ts:types} (dest: !zsock_t, format: string, args: ts): int = "mac#"

(* not supported yet *)
//fun zstr_sendx (dest: !zsock_t, const char *string, ...): int = "mac#"

(* not supported yet *)
//fun zstr_recvx (void *source, char **string_p, ...): int = "mac#"

fun zstr_free {m:addr} (self: zstr_t m): void = "mac#zstr_free_internal"
%{#
    void zstr_free_internal (char *self) {
        zstr_free (&self);
    }
%}

fun zstr_test (verbose: bool): void
