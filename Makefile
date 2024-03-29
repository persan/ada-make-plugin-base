-include Makefile.conf

all: test


Makefile.conf:Makefile
	echo "export PATH=${PATH}" >$@
	echo "export PREFIX?=$(shell dirname $(shell dirname $(shell which gnatls)))" >>${@}

generate:
	rm -rf src/gen .gen; mkdir -p src/gen .gen
	echo "#include <gnumake.h>" >.gen/gen.c
	cd .gen; gcc -c gen.c -fdump-ada-spec -C -fada-spec-parent=Gnumake_Plugin.Low_Level

	cp .gen/*gnumake_h.ads src/gen
	gprbuild -p make_plugin_base.gpr
.PHONY: test install uninstall reinstall tag  # IGNORE

test:
	gprbuild -p -P bin/helpers
	${MAKE} -C example

install:
	gprinstall -p -f -P make_plugin_base.gpr
	cp -r share/gnatstudio/templates/ada_make_plugin ${PREFIX}/share/gnatstudio/templates/
	rm -rf ${PREFIX}/lib/make_plugin_base/*

uninstall:
	rm -rf ${PREFIX}/share/gnatstudio/templates/ada_make_plugin
	@-gprinstall -f -P make_plugin_base.gpr --uninstall	
reinstall:uninstall  install

tag:test
	@bin/check v`bin/version`-`date +%Y%m%d`
	@git tag v`bin/version`-`date +%Y%m%d`
	#@git push
	#@git push --tag
