#!/bin/bash

chmod +x ./devscript/*.sh

echo "TRAVIS_BUILD_NUMBER=${TRAVIS_BUILD_NUMBER}"
echo "BUILD_APP_ENTRY=${BUILD_APP_ENTRY}"
echo "BUILD_OUTPUT_FILE_NAME=${BUILD_OUTPUT_FILE_NAME}"

docker build -t pyinstaller-windows:python3-32bit https://raw.githubusercontent.com/dev-techmoe/docker-pyinstaller/master/win32/py3/Dockerfile

# pull the docker images and create the container for build

# docker pull cdrx/pyinstaller-windows:python3
docker run -v "$(pwd):/src/" \
        -e "TRAVIS_BUILD_NUMBER=${TRAVIS_BUILD_NUMBER}" \
        -e "BUILD_APP_ENTRY=${BUILD_APP_ENTRY}" \
        -e "BUILD_OUTPUT_FILE_NAME=${BUILD_OUTPUT_FILE_NAME}" \
        pyinstaller-windows:python3-32bit "chmod +x devscript/build_pyinstaller_windows.sh && devscript/build_pyinstaller_windows.sh"
