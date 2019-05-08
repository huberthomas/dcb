#!/bin/bash
echo 'Copy files from CED to caffe'
cp -r CED/examples/CED/ caffe/examples/
cp -r CED/include/ caffe/include/
cp -r CED/src/ caffe/src/

echo 'Copy pretrained HED model'
if [ ! -e model ]; then
    mkdir model    
fi
cd model
if [ ! -e hed_vgg16.caffemodel ]; then
    wget https://doc-00-70-docs.googleusercontent.com/docs/securesc/ha0ro937gcuc7l7deffksulhg5h7mbp1/grsmq96ub8lv97q2fedesri0hrb16305/1557316800000/06119852357739176432/*/1R_kUd028OMWnPSRNBJTEkUQDrYOoSP7P?e=download
    mv 1R_kUd028OMWnPSRNBJTEkUQDrYOoSP7P?e=download hed_vgg16.caffemodel
fi
cd ..