CFLAGS=-g -Wall

OFLAGS=-O3

INTEL_LFLAGS=-qmkl
GNU_LFLAGS=-lm -lcblas

dgemmFILES=dgemm/main.c dgemm/tools.c dgemm/kernels.c
dotprodFILES=dotprod/main.c dotprod/tools.c dotprod/kernels.c
reducFILES=reduc/main.c reduc/tools.c reduc/kernels.c
n=80
r=100

all: dgemm dotprod reduc

run: all
	./dgemm/dgemm $(n) $(r)
	./dotprod/dotprod $(n) $(r)
	./reduc/reduc $(n) $(r)

dgemm:
ifeq ($(CC),icc)
	$(CC) $(CFLAGS) $(OFLAGS) $(dgemmFILES) -o $@/$@ $(INTEL_LFLAGS)
else
ifeq ($(CC),icx)
	$(CC) $(CFLAGS) $(OFLAGS) $(dgemmFILES) -o $@/$@ $(INTEL_LFLAGS)
else
ifeq ($(CC),gcc)
	$(CC) $(CFLAGS) $(OFLAGS) $(dgemmFILES) -o $@/$@ $(GNU_LFLAGS)
else
ifeq ($(CC),clang)
	$(CC) $(CFLAGS) $(OFLAGS) $(dgemmFILES) -o $@/$@ $(GNU_LFLAGS)
else
	@echo "ERROR: no compiler specified using CC. Possible values for CC: gcc, icc, icx, clang"
endif
endif
endif
endif

dotprod:
ifeq ($(CC),icc)
	$(CC) $(CFLAGS) $(OFLAGS) $(dotprodFILES) -o $@/$@ $(INTEL_LFLAGS)
else
ifeq ($(CC),icx)
	$(CC) $(CFLAGS) $(OFLAGS) $(dotprodFILES) -o $@/$@ $(INTEL_LFLAGS)
else
ifeq ($(CC),gcc)
	$(CC) $(CFLAGS) $(OFLAGS) $(dotprodFILES) -o $@/$@ $(GNU_LFLAGS)
else
ifeq ($(CC),clang)
	$(CC) $(CFLAGS) $(OFLAGS) $(dotprodFILES) -o $@/$@ $(GNU_LFLAGS)
else
	@echo "ERROR: no compiler specified using CC. Possible values for CC: gcc, icc, icx, clang"
endif
endif
endif
endif

reduc:
ifeq ($(CC),icc)
	$(CC) $(CFLAGS) $(OFLAGS) $(reducFILES) -o $@/$@ $(INTEL_LFLAGS)
else
ifeq ($(CC),icx)
	$(CC) $(CFLAGS) $(OFLAGS) $(reducFILES) -o $@/$@ $(INTEL_LFLAGS)
else
ifeq ($(CC),gcc)
	$(CC) $(CFLAGS) $(OFLAGS) $(reducFILES) -o $@/$@ $(GNU_LFLAGS)
else
ifeq ($(CC),clang)
	$(CC) $(CFLAGS) $(OFLAGS) $(reducFILES) -o $@/$@ $(GNU_LFLAGS)
else
	@echo "ERROR: no compiler specified using CC. Possible values for CC: gcc, icc, icx, clang"
endif
endif
endif
endif
.PHONY: dgemm dotprod reduc

clean:
	@rm -Rf dgemm/dgemm
	@rm -Rf dotprod/dotprod
	@rm -Rf reduc/reduc
