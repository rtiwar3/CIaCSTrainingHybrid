#!/bin/bash

set -e

git clone https://github.com/SmithaVerity/CIaCSTrainingHybrid.git
cd CIaCSTrainingHybrid/IMSServerSetup/
sh deployServer.sh
