#!/bin/bash
echo 'Copy files from CED to caffe'
cp -r ced/examples/ced/ caffe/examples/
cp -r ced/include/ caffe/
cp -r ced/src/ caffe/

cp -r hed/examples/hed/ caffe/examples/
cp -r hed/include/caffe/ caffe/include/
cp -r hed/src/caffe/ caffe/src/

echo 'Now download pretrained HED model hed_vgg16.caffemodel from https://drive.google.com/file/d/1R_kUd028OMWnPSRNBJTEkUQDrYOoSP7P/view?usp=sharing and put it to caffe/examples/hed'
echo 'Finished'