%{#
#include "czmq.h"
%}


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

#include "czmq_library.sats"