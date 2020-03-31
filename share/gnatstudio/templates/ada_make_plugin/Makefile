

all:

lib/lib@_library_name_@.so: # IGNORE
	gprbuild -j0 -p @_project_name_@.gpr

.PHONY: test # IGNORE
test:lib/lib@_library_name_@.so
	make -C test

 
