#ifndef ZSOCK_CATS
#define ZSOCK_CATS

#include "zsock.h"
void zsock_destroy_internal (zsock_t *self) {
	zsock_destroy (&self);
}
//int zsock_bind_internal (void *self, char *format) {
//	int ret = zsock_bind (self, format);
//	assert (ret >= 0);
//	return ret;
//}
//int zsock_unbind_internal (void *self, char *format) {
//	int ret = zsock_unbind (self, format);
//	assert (ret >= 0);
//	return ret;
//}
//int zsock_connect_internal (void *self, char *format) {
//	int ret = zsock_connect (self, format);
//	assert (ret >= 0);
//	return ret;
//}
//int zsock_disconnect_internal (void *self, char *format) {
//	int ret = zsock_disconnect (self, format);
//	assert (ret >= 0);
//	return ret;
//}
//int zsock_attach_internal (void *self, char *format, int serverish) {
//	int ret = zsock_attach (self, format, serverish);
//	assert (ret >= 0);
//	return ret;
//}
//int zsock_send_internal (void *self, const char *picture, ...) {
//	va_list args;
//	va_start (args, picture);
//	int ret = zsock_vsend (self, picture, args);
//	va_end (args);

//	assert (ret == 0);
//	return ret;
//}
//int zsock_recv_internal (void *self, const char *picture, ...) {
//	va_list args;
//	va_start (args, picture);
//	int ret = zsock_vrecv (self, picture, args);
//	va_end (args);

//	assert (ret == 0);
//	return ret;
//}
//int zsock_bsend_internal (void *self, const char *picture, ...) {
//	va_list args;
//	va_start (args, picture);
//	int ret = zsock_vbsend (self, picture, args);
//	va_end (args);

//	assert (ret == 0);
//	return ret;
//}
//int zsock_brecv_internal (void *self, const char *picture, ...) {
//	va_list args;
//	va_start (args, picture);
//	int ret = zsock_vbrecv (self, picture, args);
//	va_end (args);

//	assert (ret == 0);
//	return ret;
//}
int zsock_signal_internal (void *self, byte status) {
	int ret = zsock_signal (self, status);
	assert (ret == 0);
	return ret;
}
int zsock_wait_internal (void *self) {
	int ret = zsock_wait (self);
	assert (ret >= 0);
	return ret;
}
#endif