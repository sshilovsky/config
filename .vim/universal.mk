.DEFAULT: make
.PHONY: make run gdb

make:
	make

run: make
	if [ -x ./do-run ] ; then ./do-run ; else false ; fi

gdb: make
	if [ -x ./do-gdb ] ; then ./do-gdb ; else false ; fi
