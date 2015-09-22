%{#
#include "czmq_library.h"
%}


//macdef CZMQ_VERSION_MAJOR = $extval (int, "CZMQ_VERSION_MAJOR")
//macdef CZMQ_VERSION_MINOR = $extval (int, "CZMQ_VERSION_MINOR")
//macdef CZMQ_VERSION_PATCH = $extval (int, "CZMQ_VERSION_PATCH")


#include "czmq_prelude.sats"

absvtype zactor_t (l:addr) = ptr l
vtypedef zactor_t = [l:addr|l>null] zactor_t l

absvtype zchunk_t (l:addr) = ptr l
vtypedef zchunk_t = [l:addr|l>null] zchunk_t l

absvtype zframe_t (l:addr) = ptr l
vtypedef zframe_t = [l:addr|l>null] zframe_t l

absvtype zmsg_t (l:addr) = ptr l 
vtypedef zmsg_t = [l:addr|l>null] zmsg_t l

absvtype zrex_t = ptr

absvtype zstr_t (l:addr) = ptr l
vtypedef zstr_t = [l:addr|l>null] zstr_t l

absvtype zsock_t (l:addr) = ptr l
vtypedef zsock_t = [l:addr|l>null] zsock_t l


#include "zactor.sats"
#include "zchunk.sats"
#include "zclock.sats"
#include "zframe.sats"
#include "zmsg.sats"
#include "zsock.sats"
#include "zstr.sats"