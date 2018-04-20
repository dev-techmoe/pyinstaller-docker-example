#!/bin/bash

chmod +x ./devscript/*.sh

# pull the docker images and create the container for build
docker pull cdrx/pyinstaller-windows:python3
docker run -v "$(pwd):/src/" \
        -e "TRAVIS_BUILD_NUMBER=${TRAVIS_BUILD_NUMBER}" \
        -e "BUILD_APP_ENTRY=${BUILD_APP_ENTRY}" \
        -e "BUILD_OUTPUT_FILE_NAME=${BUILD_OUTPUT_FILE_NAME}" \
        cdrx/pyinstaller-windows:python3 "chmod +x devscript/build_pyinstaller_windows.sh && devscript/build_pyinstaller_windows.sh"
