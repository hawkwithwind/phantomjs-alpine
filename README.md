构建可以在alpine linux下运行的phantomjs，通过ubuntu编译后，采取dockerize提取相应的可执行文件及其依赖

采取的构建方法来自以下项目，适合中国国内环境，添加了ubuntu和pip的国内源

# thanks to
* rosenhouse phantomjs2 https://github.com/rosenhouse/phantomjs2
* larsks dockerize https://github.com/larsks/dockerize 
* fgrehm docker pahntomjs2 https://github.com/fgrehm/docker-phantomjs2
* dustinblackman phantomized https://github.com/dustinblackman/phantomized

# Build
```
./get_phantomjs.sh
docker build -t pahtomjs:build .
```


