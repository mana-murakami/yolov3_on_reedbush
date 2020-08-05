#!/bin/bash
#PBS -q h-tutorial
#PBS -l select=2:mpiprocs=2:ompthreads=1
#PBS -W group_list=gt00
#PBS -l walltime=00:15:00


MYDIR=/lustre/${GROUP}/${USER}
WORKDIR=$MYDIR/darknet

module purge
module load gnu/gcc_7.5.0
module load cmake/3.12.4
module load cuda10/10.0.130
export LD_LIBRARY_PATH=$MYDIR/usr/local/lib64:$LD_LIBRARY_PATH

cd $WORKDIR

nvidia-smi
bash ./image_yolov3.sh
