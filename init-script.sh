#!/bin/bash

set -e

git clone -b rds https://github.com/SmithaVerity/IMSServerSetup.git
cd IMSServerSetup/
sh deployServer.sh
