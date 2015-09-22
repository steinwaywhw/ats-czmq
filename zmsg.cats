#ifndef ZMSG_CATS
#define ZMSG_CATS

#include "zmsg.h"
void zmsg_destroy_internal (zmsg_t *self) {
	zmsg_destroy (&self);
}
int zmsg_send_internal (zmsg_t *self, void *dest) {
	int ret = zmsg_send (&self, dest);
	assert (ret == 0);
	return ret;
}
int zmsg_prepend_internal (zmsg_t *self, zframe_t *frame) {
	int ret = zmsg_prepend (self, &frame);
	assert (ret == 0);
	return ret;
}
int zmsg_append_internal (zmsg_t *self, zframe_t *frame) {
	int ret = zmsg_append (self, &frame);
	assert (ret == 0);
	return ret;
}
int zmsg_pushmem_internal (zmsg_t *self, const void *src, size_t size) {
	int ret = zmsg_pushmem (self, src, size);
	assert (ret == 0);
	return ret;
}
int zmsg_addmem_internal (zmsg_t *self, const void *src, size_t size) {
	int ret = zmsg_addmem (self, src, size);
	assert (ret == 0);
	return ret;
}
int zmsg_pushstr_internal (zmsg_t *self, const char *string) {
	int ret = zmsg_pushstr (self, string);
	assert (ret == 0);
	return ret;
}
int zmsg_addstr_internal (zmsg_t *self, const char *string) {
	int ret = zmsg_addstr (self, string);
	assert (ret == 0);
	return ret;
}
int zmsg_addmsg_internal (zmsg_t *self, zmsg_t *msg) {
	int ret = zmsg_addmsg (self, &msg);
	assert (ret == 0);
	return ret;
}
int zmsg_save_internal (zmsg_t *self, FILE *file) {
	int ret = zmsg_save (self, file);
	assert (ret == 0);
	return ret;
}
int zmsg_load_internal (zmsg_t *self, FILE *file) {
	int ret = zmsg_load (self, file);
	assert (ret == 0);
	return ret;
}
#endif