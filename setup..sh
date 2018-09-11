#!/bin/bash
# file: setup.sh

sudo cp ./kubeless.sh  /etc/profile.d 
source /etc/profile.d/kubeless.sh 

export KUBELESS_WORKING_DIR=$GOROOT/src/github.com/kubeless

sudo mkdir -p $KUBELESS_WORKING_DIR
cd $KUBELESS_WORKING_DIR
git clone https://github.com/mvranic/kubeless
cd $KUBELESS_WORKING_DIR/kubeless
git remote add upstream https://github.com/kubeless/kubeless.git

# Never push to upstream master
git remote set-url --push upstream no_push
# Checking your remote set correctly
git remote -v

cd $KUBELESS_WORKING_DIR/kubeless
make bootstrap
### VERY IMPORTANT:
ln -s /usr/local/go/bin/bin/gox /usr/local/go/bin

cd $KUBELESS_WORKING_DIR/kubeless
make binary
# maybe is not needed, check if ll $GOPATH/function-controller is there.
make controller-build

make binary-cross