#include "share/atspre_staload.hats"

staload "czmq.sats"

local

staload UN = "prelude/SATS/unsafe.sats"
//staload "libc/SATS/stdarg.sats"

symintr show 
overload show with print_int
overload show with print_string
overload show with print_char

in 

implement zsock_test (verbose) = () where {
	val _ = show " * zsock: "
	val _ = if verbose then show "\n"

	val writer = zsock_new_push "@tcp://127.0.0.1:5560"
	val _ = assert (zsock_to_ptr writer > 0)
	val _ = assert ((zsock_type_str writer) = "PUSH")

	val rc = zsock_unbind (writer, "tcp://127.0.0.1:%d", @(5560))
	val _ = assert (rc = 0)

	val _ = zclock_sleep 100u

	val rc = zsock_bind (writer, "tcp://127.0.0.1:%d", @(5560))
	val _ = assert (rc = 5560)
	val _ = assert ((zsock_endpoint writer) = "tcp://127.0.0.1:5560")

	val reader = zsock_new_pull ">tcp://127.0.0.1:5560"
	val _ = assert (zsock_to_ptr reader > 0)
	val _ = assert ((zsock_type_str reader) = "PULL")

	val _ = zstr_send (writer, "Hello, World")
	val msg = zmsg_recv reader
	val _ = assert (zmsg_to_ptr msg > 0)
	val string = zmsg_popstr msg
	val _ = assert (zstr_to_ptr string > 0)
	val _ = assert (zstr_to_string string = "Hello, World")
	val _ = zstr_free string
	val _ = zmsg_destroy msg

	macdef DYNAMIC_FIRST = $extval (int, "DYNAMIC_FIRST")
	macdef DYNAMIC_LAST = $extval (int, "DYNAMIC_LAST")

	val port = zsock_bind (writer, "tcp://127.0.0.1:*", @())
    val _ = assert (port >= DYNAMIC_FIRST && port <= DYNAMIC_LAST)
    val port = zsock_bind (writer, "tcp://127.0.0.1:*[50000-]", @())
    val _ = assert (port >= 50000 && port <= DYNAMIC_LAST)
    val port = zsock_bind (writer, "tcp://127.0.0.1:*[-50001]", @())
    val _ = assert (port >= DYNAMIC_FIRST && port <= 50001)
    val port = zsock_bind (writer, "tcp://127.0.0.1:*[60000-60050]", @())
    val _ = assert (port >= 60000 && port <= 60050)

    val port = zsock_bind (writer, "tcp://127.0.0.1:!", @())
    val _ = assert (port >= DYNAMIC_FIRST && port <= DYNAMIC_LAST)
    val port = zsock_bind (writer, "tcp://127.0.0.1:![50000-]", @())
    val _ = assert (port >= 50000 && port <= DYNAMIC_LAST)
    val port = zsock_bind (writer, "tcp://127.0.0.1:![-50001]", @())
    val _ = assert (port >= DYNAMIC_FIRST && port <= 50001)
    val port = zsock_bind (writer, "tcp://127.0.0.1:![60000-60050]", @())
    val _ = assert (port >= 60000 && port <= 60050)

    val server = zsock_new ZMQ_DEALER
    val _ = assert (zsock_to_ptr server > 0)
    val rc = zsock_attach (server, "@inproc://myendpoint,tcp://127.0.0.1:5556,inproc://others", true)
    val _ = assert (rc = 0)
    val rc = zsock_attach (server, "", false)
    val _ = assert (rc = 0)
    val rc = zsock_attach (server, $UN.cast{string}(0), true)
    val _ = assert (rc = 0)
    val rc = zsock_attach (server, ">a,@b, c,, ", false)
    val _ = assert (rc = ~1)
    val _ = zsock_destroy server

    val rc = zsock_bind (writer, "inproc://test.%s", @("writer"))
    val _ = assert (rc = 0)
    val _ = assert (zsock_endpoint writer = "inproc://test.writer")

    val rc = zsock_connect (reader, "txp://127.0.0.1:5560", @())
    val _ = assert (rc = ~1)

    val rc = zsock_signal (writer, 123)
    val _ = assert (rc = 0)
    val rc = zsock_wait reader
    val _ = assert (rc = 123)












    val _ = zsock_destroy reader
    val _ = zsock_destroy writer
}

end