
%{#
#include "zsock.cats"
#include "zmsg.cats"
#include "zstr.cats"
%}

staload "czmq.sats"



implement main0 () = zmsg_test true