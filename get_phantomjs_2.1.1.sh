#!/bin/bash

git clone https://github.com/ariya/phantomjs.git
cd phantomjs
git checkout 2.1.1
git submodule init
git submodule update

