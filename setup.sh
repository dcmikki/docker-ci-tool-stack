#!/bin/sh
#
# Simply execute this script to setup the full toolchain:
#
# curl -sSL https://raw.githubusercontent.com/dcmikki/docker-ci-tool-stack/master/setup.sh | bash -s
#
# Prerequisites:
# - Docker & Docker Toolbox v1.10
# - Git v2.6.4

echo "Create docker machine"
docker-machine create -d virtualbox --virtualbox-memory "6000" docker-ci-tools

echo "Setup environment"
eval $(docker-machine env docker-ci-tools)

echo "Checkout Git Repository"
git clone https://github.com/dcmikki/docker-ci-tool-stack.git
cd docker-ci-tool-stack
git clone https://github.com/sonatype/docker-nexus3.git

echo "Startup Docker Compose"
docker-compose up
