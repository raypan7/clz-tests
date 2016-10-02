CC = gcc
CFLAGS = -O0 -std=gnu99 -Wall 
EXECUTABLE = \
	clz_recursive clz_iteration clz_binary_search \
	clz_byte_shift clz_harley \
	clz_benchmark runtime.png \

default: clz.o
	$(CC) $(CFLAGS) clz.o time_test.c -DRECURSIVE -o clz_recursive
	$(CC) $(CFLAGS) clz.o time_test.c -DITERATION -o clz_iteration
	$(CC) $(CFLAGS) clz.o time_test.c -DBINARYSEARCH -o clz_binary_search
	$(CC) $(CFLAGS) clz.o time_test.c -DBYTESHIFT -o clz_byte_shift
	$(CC) $(CFLAGS) clz.o time_test.c -DHARLEY -o clz_harley
	$(CC) $(CFLAGS) clz.o clz_benchmark.c -o clz_benchmark

.PHONY: clean default

%.o: %.c
	$(CC) -c $(CFLAGS) $< -o $@ 

check: default
	time ./clz_recursive
	time ./clz_iteration
	time ./clz_binary_search
	time ./clz_byte_shift
	time ./clz_harley

gencsv: default
	for i in `seq 10000000 100 30000000`; do \
		printf "%d," $$i;\
		./clz_benchmark $$i; \
	done > clz_result.csv	

plot: gencsv
	gnuplot runtime.gp

clean:
	rm -f $(EXECUTABLE) *.o *.s clz_result.csv clz_runtime.png
