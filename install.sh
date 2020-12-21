#!/bin/bash

MAINDIR=$PWD

WORKSPACE=$PWD/planning-ws
mkdir $WORKSPACE && cd $WORKSPACE

INSTALL_DIR=$WORKSPACE/install

git clone https://github.com/rock-core/base-cmake.git base-cmake
git clone https://github.com/rock-planning/planning-lama.git lama

cd $WORKSPACE/base-cmake
mkdir build && cd build
cmake -DCMAKE_INSTALL_PREFIX=$INSTALL_DIR ..
make install

export Rock_DIR=$INSTALL_DIR/share/rock/cmake/

cd $WORKSPACE/lama
mkdir build && cd build
cmake -DCMAKE_INSTALL_PREFIX=$INSTALL_DIR ..
make install

export PATH=$INSTALL_DIR/bin:$PATH

lama-planner --help

