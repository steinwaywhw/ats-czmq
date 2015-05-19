

all:
	patscc -o test czmq.dats zsock.dats -lzmq -lczmq -DATS_MEMALLOC_LIBC 