#!/bin/bash
echo 'Copy files from CED to caffe'
cp -r ced/examples/ced/ caffe/examples/
cp -r ced/include/ caffe/
cp -r ced/src/ caffe/

echo 'Now download pretrained HED model hed_vgg16.caffemodel from https://drive.google.com/file/d/1R_kUd028OMWnPSRNBJTEkUQDrYOoSP7P/view?usp=sharing and put it to caffe/examples/hed'
echo 'Finished'