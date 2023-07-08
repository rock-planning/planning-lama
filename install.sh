#!/bin/bash

MAINDIR=$PWD


INSTALL_DIR=$PWD/lama-planner

# Get, compile, and install base-cmaks share libs
rm -rf base-cmake
git clone https://github.com/rock-core/base-cmake.git base-cmake
cd base-cmake
mkdir build && cd build
cmake -DCMAKE_INSTALL_PREFIX=$INSTALL_DIR ..
make install
export Rock_DIR=$INSTALL_DIR/share/rock/cmake/

# compile & install LAMA
cd $MAINDIR
mkdir build && cd build
cmake -DCMAKE_INSTALL_PREFIX=$INSTALL_DIR ..
make install

export PATH=$INSTALL_DIR/bin:$PATH

lama-planner --help

