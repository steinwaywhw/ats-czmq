%{#
#include "zchunk.h"
%}

castfn zchunk_to_ptr {m:addr} (self: !zchunk_t m): ptr m 

fun zchunk_new {l:addr|l>null} (data: ptr l, size: size_t): [m:addr] zchunk_t m = "mac#"
fun zchunk_destroy {l:addr} (self: zchunk_t l): void = "mac#zchunk_destroy_internal"
%{#
    void zchunk_destroy_internal (zchunk_t *self) {
        zchunk_destroy (&self);
    }
%}

fun zchunk_resize (self: !zchunk_t, size: size_t): void = "mac#"
fun zchunk_size (self: !zchunk_t): size_t = "mac#"
fun zchunk_max_size (self: !zchunk_t): size_t = "mac#"

(* not safe *)
fun zchunk_data (self: !zchunk_t): [m:addr|m>null] ptr m = "mac#"

fun zchunk_set {m:addr} (self: !zchunk_t, data: ptr m, size: size_t): size_t = "mac#"
fun zchunk_fill (self: !zchunk_t, filler: byte, size: size_t): size_t = "mac#"
fun zchunk_append {m:addr|m>null} (self: !zchunk_t, data: ptr m, size: size_t): size_t = "mac#"
fun zchunk_extend {m:addr|m>null} (self: !zchunk_t, data: ptr m, size: size_t): size_t = "mac#"
fun zchunk_consume (self: !zchunk_t, source: !zchunk_t): size_t = "mac#"
fun zchunk_exhausted (self: !zchunk_t): bool = "mac#"
fun zchunk_read (handle: FILEref, bytes: size_t): [m:addr] zchunk_t m = "mac#"
fun zchunk_write (self: !zchunk_t, handle: FILEref): int = "mac#zchunk_write_internal"
%{#
    int zchunk_write_internal (zchunk_t *self, FILE *handle) {
        int ret = zchunk_write (self, handle);
        assert (ret == 0);
        return ret;
    }
%}

fun zchunk_slurp (filename: string, maxsize: size_t): [m:addr] zchunk_t m = "mac#"
fun zchunk_dup (self: !zchunk_t): [m:addr] zchunk_t m = "mac#"
fun zchunk_strhex (self: !zchunk_t): [m:addr] zstr_t m = "mac#"
fun zchunk_strdup (self: !zchunk_t): [m:addr] zstr_t m  = "mac#"
fun zchunk_streq (self: !zchunk_t, string: string): bool = "mac#"
fun zchunk_pack (self: !zchunk_t): [m:addr] zframe_t m = "mac#"
fun zchunk_unpack (frame: !zframe_t): [m:addr] zchunk_t m= "mac#"
fun zchunk_digest (self: !zchunk_t): [m:addr] zstr_t m  = "mac#"
fun zchunk_fprint (self: !zchunk_t, file: FILEref): void = "mac#"
fun zchunk_print (self: !zchunk_t): void = "mac#"

(* zchunk_is is not needed *)

//  Self test of this class
fun zchunk_test (verbose: bool): void

