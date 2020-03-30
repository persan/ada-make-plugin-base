-include Makefile.conf

all:


Makefile.conf:Makefile
	echo "export PATH=${PATH}" >$@

generate:
	rm -rf src/gen .gen; mkdir -p src/gen .gen
	echo "#include <gnumake.h>" >.gen/gen.c
	cd .gen; gcc -c gen.c -fdump-ada-spec -C -fada-spec-parent=Gnumake_Plugin.Low_Level

	cp .gen/*gnumake_h.ads src/gen
	gprbuild -p make_plugin_base.gpr
.PHONY: test
test:
	gprbuild -p make_plugin_base.gpr
	${MAKE} -C test

install:
	
