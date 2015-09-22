%{#
#include "czmq_prelude.h"
%}


fun zmalloc {n:nat} (size: size_t n): [l:addr|l>null] (@[byte][n] @ l | ptr l) = "mac#"

(* added in ATS *)
fun zfree {l:addr|l>null} {n:nat} (@[byte][n] @ l | ptr l): void = "mac#free"