#!/bin/bash

docker build -t phantomjs-2.1.1:build -f Dockerfile.2.1.1 .

docker run --rm -v $(pwd):/home/workspace -w /home/workspace phantomjs-2.1.1:build /bin/bash ./dockerize-phantomjs.sh
