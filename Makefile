generate:
	rm -rf src/gen .gen; mkdir -p src/gen .gen
	echo "#include <gnumake.h>" >.gen/gen.c
	cd .gen; gcc -c gen.c -fdump-ada-spec -C
	cp .gen/*gnumake_h.ads src/gen
	gprbuild -p adamake.gpr
test:
	gprbuild -p adamake.gpr
	make -f test.mk
