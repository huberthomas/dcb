# Deep Crisp Boundaries

## Prerequisites

The following subsections are a summary of the instructions from [Building Nvidia Digits](https://github.com/NVIDIA/DIGITS/blob/master/docs/BuildDigits.md) and [Building Caffe](https://github.com/NVIDIA/DIGITS/blob/master/docs/BuildCaffe.md).

### Install repo packages
    CUDA_REPO_PKG=http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1604/x86_64/cuda-repo-ubuntu1604_8.0.61-1_amd64.deb
    ML_REPO_PKG=http://developer.download.nvidia.com/compute/machine-learning/repos/ubuntu1604/x86_64/nvidia-machine-learning-repo-ubuntu1604_1.0.0-1_amd64.deb

    wget "$CUDA_REPO_PKG" -O /tmp/cuda-repo.deb && sudo dpkg -i /tmp/cuda-repo.deb && rm -f /tmp/cuda-repo.deb
    wget "$ML_REPO_PKG" -O /tmp/ml-repo.deb && sudo dpkg -i /tmp/ml-repo.deb && rm -f /tmp/ml-repo.deb

    sudo apt-get update

### Download new list of packages
    sudo apt-get install --no-install-recommends git graphviz python-dev python-flask python-flaskext.wtf python-gevent python-h5py python-numpy python-pil python-pip python-scipy python-tk

    sudo apt-get install --no-install-recommends build-essential cmake git gfortran libatlas-base-dev libboost-filesystem-dev libboost-python-dev libboost-system-dev libboost-thread-dev libgflags-dev libgoogle-glog-dev libhdf5-serial-dev libleveldb-dev liblmdb-dev libopencv-dev libsnappy-dev python-all-dev python-dev python-h5py python-matplotlib python-numpy python-opencv python-pil python-pip python-pydot python-scipy python-skimage python-sklearn

### Building Protobuf 3.2.1

[Reference](https://github.com/NVIDIA/DIGITS/blob/master/docs/BuildProtobuf.md)

    sudo apt-get install autoconf automake libtool curl make g++ git python-dev python-setuptools unzip

    git clone https://github.com/google/protobuf.git -b v3.2.1

    ./autogen.sh
    ./configure
    make "-j$(nproc)"
    sudo make install
    sudo ldconfig
    cd python
    sudo python setup.py install --cpp_implementation

### Cuda

    # Select one repository from http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1604/x86_64/
    wget http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1604/x86_64/cuda-repo-ubuntu1604_9.0.176-1_amd64.deb

    sudo apt update
    sudo apt install cuda-9-0

## Ubuntu 16.04 Installation

1. Clone repository

    git clone git@github.com:huberthomas/dcb.git --recursive

2. Execute install script

    bash install.sh

3. Build [Caffe](https://github.com/NVIDIA/DIGITS/blob/master/docs/BuildCaffe.md)

    sudo apt install cmake-curses-gui
    cd caffe
    pip install --upgrade pip --user
    sudo pip install -r python/requirements.txt
    mkdir build
    cd build
    ccmake ..
    make -j"$(nproc)"
    make runtest
    make pytest
    make install

## MatCaffe

    Build caffe than
    sudo ln caffe/build/lib/libcaffe-nv.so /usr/local/lib/libcaffe.so
    sudo ldconfig

    Rebuild Caffe by setting Matlab_DIR to /usr/local/MATLAB/R2018a. But keep in mind that because of Matlab you have to use gcc/g++ 6.3 compiler.
    

## Training

Download the [BSDS500 dataset](http://vcl.ucsd.edu/hed/HED-BSDS.tar) and extract it to the data directory.

    cd caffe/examples/ced

    Put the [pretrained HED model](https://drive.google.com/file/d/1R_kUd028OMWnPSRNBJTEkUQDrYOoSP7P/view?usp=sharing) in the caffe/examples/ced directory.
    Modify train_val.protoxt (entry root_folder and source) to your data directory path. 

    python solve.py -h

## Testing

    cd caffe/examples/ced
    python forward_all.py -h

## Hints

### Jupyter

sudo apt-get update
sudo apt-get -y install python-pip python-dev
sudo -H pip install --upgrade pip
sudo apt-get -y install ipython ipython-notebook
sudo -H pip install jupyter

jupyter notebook  xyz.ipynb

## Acknowledgements

Big thanks to...

Caffe for their great [work](https://caffe.berkeleyvision.org/).
NVIDA for their great [descriptions](https://github.com/NVIDIA/DIGITS/blob/master/docs/BuildDigits.md).
the team around [HED](https://github.com/s9xie/hed).
the team around [CED](https://github.com/Wangyupei/CED).

