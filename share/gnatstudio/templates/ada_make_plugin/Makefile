

# Where the final library shall be installed
TARGET=_target

LIBRARY_DIR=lib
LIBRARY_NAME=lib@_library_name_@.so
LIBRARY_PATH=${LIBRARY_DIR}/${LIBRARY_NAME}

all:test

${LIBRARY_PATH}: # IGNORE
	gprbuild -j0 -p @_project_name_@.gpr

.PHONY: test # IGNORE
test:${LIBRARY_PATH}
	make -C test

install:${LIBRARY_PATH}
	mkdir -p ${TARGET}
	cp $< ${TARGET}/
	
uninstall:
	rm ${TARGET}/${LIBRARY_NAME}
