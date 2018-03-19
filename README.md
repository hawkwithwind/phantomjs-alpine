构建可以在alpine linux下运行的phantomjs，通过ubuntu编译后，采取dockerize提取相应的可执行文件及其依赖

采取的构建方法来自以下项目，适合中国国内环境，添加了ubuntu和pip的国内源

# thanks to
* rosenhouse phantomjs2 https://github.com/rosenhouse/phantomjs2
* larsks dockerize https://github.com/larsks/dockerize 
* fgrehm docker pahntomjs2 https://github.com/fgrehm/docker-phantomjs2
* dustinblackman phantomized https://github.com/dustinblackman/phantomized

# Build
出于国内网络环境考虑，phantomjs源码的clone单独处理，需要将源码放置在本项目根目录下，构建时，会将该源码目录加入镜像中进行编译

```
./get_phantomjs_2.1.1.sh
./run-dockerize-2.1.1.sh
```

# Other Trials
## build directly upon alpine, does not work

测试了以下项目，不成功，在alpine:3.3上无法运行最基本的 hello, world
- https://github.com/ncopa/docker-phantomjs-alpine

相关的issue
- https://bugs.alpinelinux.org/issues/4664
- https://github.com/ariya/phantomjs/issues/14186

