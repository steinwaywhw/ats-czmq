%{#
#include "zactor.h"
%}

//typedef zactor_fn = {l:addr} (!zsock_t, ptr l) -> void


//fun zactor_new (task: zactor_fn, args: ptr l): zactor_t * 

////  Destroy an actor.
//fun zactor_destroy (zactor_t **self_p): void 

////  Send a zmsg message to the actor, take ownership of the message
////  and destroy when it has been sent.                             
//fun zactor_send (zactor_t *self, zmsg_t **msg_p): int 

////  Receive a zmsg message from the actor. Returns NULL if the actor 
////  was interrupted before the message could be received, or if there
////  was a timeout on the actor.                                      
////  The caller is responsible for destroying the return value when finished with it.
//fun zactor_recv (zactor_t *self): zmsg_t * 

////  Probe the supplied object, and report if it looks like a zactor_t.
//fun zactor_is (void *self): bool 

////  Probe the supplied reference. If it looks like a zactor_t instance,
////  return the underlying libzmq actor handle; else if it looks like   
////  a libzmq actor handle, return the supplied value.                  
//fun zactor_resolve (void *self): void * 

////  Return the actor's zsock handle. Use this when you absolutely need
////  to work with the zsock instance rather than the actor.            
//fun zactor_sock (zactor_t *self): zsock_t * 

////  Self test of this class.
//fun zactor_test (bool verbose): void 
////  @end