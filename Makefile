SRC_DIR = source
BUILD_DIR = build
UGLIFY = uglifyjs --unsafe -nc
FOUNDRY_DIR = ../..
PRODUCTION_DIR = ${FOUNDRY_DIR}/scripts
DEVELOPMENT_DIR = ${FOUNDRY_DIR}/scripts_
MODULARIZE = ${FOUNDRY_DIR}/build/modularize
BASE_FILES = ${SRC_DIR}/jquery.autogrow.js

all: premake body min foundry

premake:
	mkdir -p ${BUILD_DIR}

body:
	@@cat ${BASE_FILES} > ${BUILD_DIR}/jquery.autogrow.js

min:
	${UGLIFY} ${BUILD_DIR}/jquery.autogrow.js > ${BUILD_DIR}/jquery.autogrow.min.js

foundry:
	${MODULARIZE} -n "autogrow" ${BUILD_DIR}/jquery.autogrow.js > ${DEVELOPMENT_DIR}/autogrow.js
	${UGLIFY} ${DEVELOPMENT_DIR}/autogrow.js > ${PRODUCTION_DIR}/autogrow.js




