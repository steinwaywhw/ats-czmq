#ifndef ZSTR_CATS
#define ZSTR_CATS 

#include "zstr.h"
int zstr_send_internal (void *dest, const char *string) {
    int ret = zstr_send (dest, string);
    assert (ret == 0);
    return ret;
}
int zstr_sendm_internal (void *dest, const char *string) {
    int ret = zstr_sendm (dest, string);
    assert (ret == 0);
    return ret;
}
void zstr_free_internal (char *self) {
    zstr_free (&self);
}

#endif
