#!/bin/bash

docker build -t phantomjs:build .

docker run --rm -v $(pwd):/home/workspace -w /home/workspace phantomjs:build /bin/bash ./dockerize-phantomjs.sh
