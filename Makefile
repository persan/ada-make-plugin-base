-include Makefile.conf

all:


Makefile.conf:Makefile
	echo "export PATH=${PATH}" >$@
	echo "export PREFIX?=$(shell dirname $(shell dirname $(shell which gnatls)))" >>${@}

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
	gprinstall -p -f -P make_plugin_base.gpr
	cp -r share/gnatstudio/templates/ada_make_plugin ${PREFIX}/share/gnatstudio/templates/
	rm -rf ${PREFIX}/lib/make_plugin_base/*
uninstall:
	rm -rf ${PREFIX}/share/gnatstudio/templates/ada_make_plugin
	@-gprinstall -f -P make_plugin_base.gpr --uninstall	
