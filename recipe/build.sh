#!/usr/bin/env bash

set -o xtrace -o nounset -o pipefail -o errexit

cmake -S . -B build -GNinja ${CMAKE_ARGS}
cmake --build build
if [[ ${build_platform} == ${test_platform} ]]; then
ctest --test-dir build --output-on-failure
fi
cmake --install build
