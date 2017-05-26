#!/bin/bash

# geting JOB ID, bucket name
BUCKETNAME="openfoam1kirk"



# setup OpenFoam-dev
source /opt/openfoam4/etc/bashrc
source /root/.bashrc
export PATH=/root/.local/bin:$PATH

cd /root
mkdir -p $FOAM_RUN
cd $FOAM_RUN

#set up case directory
aws s3 cp s3://$BUCKETNAME/case . --recursive

./Allrun

#cp -r $FOAM_TUTORIALS/incompressible/simpleFoam/pitzDaily .
#cd pitzDaily
#blockMesh
#simpleFoam

# upload U to S3
#TIMESTAMP=`date +%Y%m%d%H%M%S%N`
aws s3 sync . s3://$BUCKETNAME/case
