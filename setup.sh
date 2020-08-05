#!/bin/sh

module purge
module load cmake/3.12.4
module load gnu/gcc_7.5.0
module load cuda10/10.0.130
module load anaconda2/4.3.0

# setup
MYDIR=/lustre/${GROUP}/${USER}
WORKDIR=$MYDIR/darknet

cd $MYDIR
mkdir ./usr
mkdir ./usr/local
export LD_LIBRARY_PATH=$MYDIR/usr/local/lib64:$LD_LIBRARY_PATH

# install OpenCV
pip install --user bs4
wget https://github.com/opencv/opencv/archive/3.4.0.tar.gz
tar xvzf 3.4.0.tar.gz
cd opencv-3.4.0/
mkdir build
git clone -b 3.4.0 https://github.com/Itseez/opencv_contrib.git extra_modules
cd build/

cmake -D CMAKE_INSTALL_PREFIX=$MYDIR/usr/local -D CMAKE_BUILD_TYPE=Release-D\
WITH_CUDA=ON -D ENABLE_FAST_MATH=1 -D CUDA_FAST_MATH=1 -D WITH_CUBLAS=1 -D INSTALL_PYTHON_EXAMPLES=ON -D\
OPENCV_EXTRA_MODULES_PATH=../extra_modules/modules -D BUILD_EXAMPLES=ON -DENABLE_PRECOMPILED_HEADERS=OFF -D\
BUILD_OPENCV_CUDACODEC=OFF -DBUILD_OPENCV_HDF=OFF ..
make
make install

# install Yolov3
cd $MYDIR
git clone https://github.com/AlexeyAB/darknet
cd darknet
./build.sh
