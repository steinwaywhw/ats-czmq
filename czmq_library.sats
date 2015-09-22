%{#
#include "czmq_library.h"
%}


macdef CZMQ_VERSION_MAJOR = $extval (int, "CZMQ_VERSION_MAJOR")
macdef CZMQ_VERSION_MINOR = $extval (int, "CZMQ_VERSION_MINOR")
macdef CZMQ_VERSION_PATCH = $extval (int, "CZMQ_VERSION_PATCH")
macdef CZMQ_VERSION = $extval (int, "CZMQ_VERSION")


(* Copied from zmq.sats *)
abst@ype zsocktype = int 

macdef ZMQ_PAIR    = $extval (zsocktype, "ZMQ_PAIR")
macdef ZMQ_PUB     = $extval (zsocktype, "ZMQ_PUB")
macdef ZMQ_SUB     = $extval (zsocktype, "ZMQ_SUB")
macdef ZMQ_REQ     = $extval (zsocktype, "ZMQ_REQ")
macdef ZMQ_REP     = $extval (zsocktype, "ZMQ_REP")
macdef ZMQ_DEALER  = $extval (zsocktype, "ZMQ_DEALER")
macdef ZMQ_ROUTER  = $extval (zsocktype, "ZMQ_ROUTER")
macdef ZMQ_PULL    = $extval (zsocktype, "ZMQ_PULL")
macdef ZMQ_PUSH    = $extval (zsocktype, "ZMQ_PUSH")
macdef ZMQ_XPUB    = $extval (zsocktype, "ZMQ_XPUB")
macdef ZMQ_XSUB    = $extval (zsocktype, "ZMQ_XSUB")
macdef ZMQ_STREAM  = $extval (zsocktype, "ZMQ_STREAM")
>>>>>>> a0d799cb03d0e3cea3b78814668ced7725d8d3e6


absvtype zactor_t (l:addr) = ptr l 
vtypedef zactor_t = [l:addr|l>null] zactor_t l
absvtype zauth_t (l:addr) = ptr l 
vtypedef zauth_t = [l:addr|l>null] zauth_t l
absvtype zarmour_t (l:addr) = ptr l 
vtypedef zarmour_t = [l:addr|l>null] zarmour_t l
absvtype zbeacon_t (l:addr) = ptr l 
vtypedef zbeacon_t = [l:addr|l>null] zbeacon_t l
absvtype zcert_t (l:addr) = ptr l 
vtypedef zcert_t = [l:addr|l>null] zcert_t l
absvtype zcertstore_t (l:addr) = ptr l 
vtypedef zcertstore_t = [l:addr|l>null] zcertstore_t l
absvtype zchunk_t (l:addr) = ptr l 
vtypedef zchunk_t = [l:addr|l>null] zchunk_t l
absvtype zclock_t (l:addr) = ptr l 
vtypedef zclock_t = [l:addr|l>null] zclock_t l
absvtype zconfig_t (l:addr) = ptr l 
vtypedef zconfig_t = [l:addr|l>null] zconfig_t l
absvtype zdigest_t (l:addr) = ptr l 
vtypedef zdigest_t = [l:addr|l>null] zdigest_t l
absvtype zdir_t (l:addr) = ptr l 
vtypedef zdir_t = [l:addr|l>null] zdir_t l
absvtype zdir_patch_t (l:addr) = ptr l 
vtypedef zdir_patch_t = [l:addr|l>null] zdir_patch_t l
absvtype zfile_t (l:addr) = ptr l 
vtypedef zfile_t = [l:addr|l>null] zfile_t l
absvtype zframe_t (l:addr) = ptr l 
vtypedef zframe_t = [l:addr|l>null] zframe_t l
absvtype zgossip_t (l:addr) = ptr l 
vtypedef zgossip_t = [l:addr|l>null] zgossip_t l
absvtype zhashx_t (l:addr) = ptr l 
vtypedef zhashx_t = [l:addr|l>null] zhashx_t l
absvtype ziflist_t (l:addr) = ptr l 
vtypedef ziflist_t = [l:addr|l>null] ziflist_t l
absvtype zlistx_t (l:addr) = ptr l 
vtypedef zlistx_t = [l:addr|l>null] zlistx_t l
absvtype zloop_t (l:addr) = ptr l 
vtypedef zloop_t = [l:addr|l>null] zloop_t l
absvtype zmonitor_t (l:addr) = ptr l 
vtypedef zmonitor_t = [l:addr|l>null] zmonitor_t l
absvtype zmsg_t (l:addr) = ptr l 
vtypedef zmsg_t = [l:addr|l>null] zmsg_t l
absvtype zpoller_t (l:addr) = ptr l 
vtypedef zpoller_t = [l:addr|l>null] zpoller_t l
absvtype zproxy_t (l:addr) = ptr l 
vtypedef zproxy_t = [l:addr|l>null] zproxy_t l
absvtype zrex_t (l:addr) = ptr l 
vtypedef zrex_t = [l:addr|l>null] zrex_t l
absvtype zsock_t (l:addr) = ptr l 
vtypedef zsock_t = [l:addr|l>null] zsock_t l
absvtype zsock_option_t (l:addr) = ptr l 
vtypedef zsock_option_t = [l:addr|l>null] zsock_option_t l
absvtype zstr_t (l:addr) = ptr l 
vtypedef zstr_t = [l:addr|l>null] zstr_t l
absvtype zsys_t (l:addr) = ptr l 
vtypedef zsys_t = [l:addr|l>null] zsys_t l
absvtype ztrie_t (l:addr) = ptr l 
vtypedef ztrie_t = [l:addr|l>null] ztrie_t l
absvtype zuuid_t (l:addr) = ptr l 
vtypedef zuuid_t = [l:addr|l>null] zuuid_t l
absvtype zauth_v2_t (l:addr) = ptr l 
vtypedef zauth_v2_t = [l:addr|l>null] zauth_v2_t l
absvtype zbeacon_v2_t (l:addr) = ptr l 
vtypedef zbeacon_v2_t = [l:addr|l>null] zbeacon_v2_t l
absvtype zctx_t (l:addr) = ptr l 
vtypedef zctx_t = [l:addr|l>null] zctx_t l
absvtype zhash_t (l:addr) = ptr l 
vtypedef zhash_t = [l:addr|l>null] zhash_t l
absvtype zlist_t (l:addr) = ptr l 
vtypedef zlist_t = [l:addr|l>null] zlist_t l
absvtype zmonitor_v2_t (l:addr) = ptr l 
vtypedef zmonitor_v2_t = [l:addr|l>null] zmonitor_v2_t l
absvtype zmutex_t (l:addr) = ptr l 
vtypedef zmutex_t = [l:addr|l>null] zmutex_t l
absvtype zproxy_v2_t (l:addr) = ptr l 
vtypedef zproxy_v2_t = [l:addr|l>null] zproxy_v2_t l
absvtype zsocket_t (l:addr) = ptr l 
vtypedef zsocket_t = [l:addr|l>null] zsocket_t l
absvtype zsockopt_t (l:addr) = ptr l 
vtypedef zsockopt_t = [l:addr|l>null] zsockopt_t l
absvtype zthread_t (l:addr) = ptr l 
vtypedef zthread_t = [l:addr|l>null] zthread_t l


#include "zactor.sats"
#include "zchunk.sats"
#include "zclock.sats"
#include "zframe.sats"
#include "zmsg.sats"
#include "zsock.sats"
#include "zstr.sats"


