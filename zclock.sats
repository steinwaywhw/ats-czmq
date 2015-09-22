%{#
#include "zclock.h"
%}

fun zclock_sleep (msecs: uint): void = "mac#"
fun zclock_time (void): int64 = "mac#"
fun zclock_mono (void): int64 = "mac#"
fun zclock_usecs (void): int64 = "mac#"
fun zclock_timestr (void): zstr_t = "mac#"

(* should be in ATS *)
fun zclock_test (verbose: bool): void
