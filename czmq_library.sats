%{#
#include "czmq_library.h"
%}


//macdef CZMQ_VERSION_MAJOR = $extval (int, "CZMQ_VERSION_MAJOR")
//macdef CZMQ_VERSION_MINOR = $extval (int, "CZMQ_VERSION_MINOR")
//macdef CZMQ_VERSION_PATCH = $extval (int, "CZMQ_VERSION_PATCH")

(* Copied from zmq.h *)
abst@ype zsocktype = int 

macdef ZMQ_PAIR    = $extval(zsocktype, "ZMQ_PAIR")
macdef ZMQ_PUB     = $extval(zsocktype, "ZMQ_PUB")
macdef ZMQ_SUB     = $extval(zsocktype, "ZMQ_SUB")
macdef ZMQ_REQ     = $extval(zsocktype, "ZMQ_REQ")
macdef ZMQ_REP     = $extval(zsocktype, "ZMQ_REP")
macdef ZMQ_DEALER  = $extval(zsocktype, "ZMQ_DEALER")
macdef ZMQ_ROUTER  = $extval(zsocktype, "ZMQ_ROUTER")
macdef ZMQ_PULL    = $extval(zsocktype, "ZMQ_PULL")
macdef ZMQ_PUSH    = $extval(zsocktype, "ZMQ_PUSH")
macdef ZMQ_XPUB    = $extval(zsocktype, "ZMQ_XPUB")
macdef ZMQ_XSUB    = $extval(zsocktype, "ZMQ_XSUB")
macdef ZMQ_STREAM  = $extval(zsocktype, "ZMQ_STREAM")


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


#include "zchunk.sats"
#include "zclock.sats"
#include "zframe.sats"
#include "zmsg.sats"
#include "zsock.sats"
#include "zstr.sats"