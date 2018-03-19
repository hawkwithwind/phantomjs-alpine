FROM ubuntu:16.04
MAINTAINER hawkwithwind

COPY sources.list /etc/apt/
COPY phantomjs /usr/src/phantomjs

# Dependencies we just need for building phantomjs
ENV buildDependencies\
    wget unzip build-essential g++ flex bison gperf\
    ruby perl libsqlite3-dev libfontconfig1-dev

# Dependencies we need for running phantomjs
ENV phantomJSDependencies\
  libicu-dev libfontconfig1 libjpeg-dev libfreetype6\
  libssl-dev libpng-dev\
  python python-pip curl rsync xfonts-base binutils

# Installing phantomjs
RUN \
	# Installing dependencies
	    apt-get update -y \
	&&  apt-get install -yf ${buildDependencies} ${phantomJSDependencies}

RUN \
	cd /usr/src/phantomjs \
	  # Building phantom
	&&  ./build.sh --confirm \
	  # Removing everything but the binary
	&&  ls -A | grep -v bin | xargs rm -rf \
	  # Symlink phantom so that we are able to run `phantomjs`
	&&  ln -s /usr/src/phantomjs/bin/phantomjs /usr/local/share/phantomjs \
	&&  ln -s /usr/src/phantomjs/bin/phantomjs /usr/local/bin/phantomjs \
	&&  ln -s /usr/src/phantomjs/bin/phantomjs /usr/bin/phantomjs \
	    # Removing build dependencies, clean temporary files
	&&  apt-get purge -y ${buildDependencies} \
	&&  apt-get autoremove -y \
	&&  apt-get clean \
	&&  rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
	  # Checking if phantom works
	&&  phantomjs -v

# Installing dockerize
ENV PIP_CONF_DIR /usr/share/.config/pip
COPY pip.conf $PIP_CONF_DIR/pip.conf
RUN pip --no-cache-dir install dockerize





