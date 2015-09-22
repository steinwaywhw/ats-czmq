

all:
	patscc -o test czmq.dats zmsg.dats -lzmq -lczmq -DATS_MEMALLOC_LIBC 

clean:
	rm *ats.c 