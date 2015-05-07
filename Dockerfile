FROM debian:7.8
MAINTAINER DevOps@bq "devops@bq.com"

WORKDIR /deploy

RUN \
  apt-get update -qq && \
  apt-get install -y build-essential libmount1 libblkid1 libfuse-dev fuse-utils libcurl4-openssl-dev libxml2-dev mime-support automake libtool wget tar && \
  wget https://github.com/leo-project/s3fs-c/archive/feature/ommit-iam-role.tar.gz && \
  tar xvzf ommit-iam-role.tar.gz && \
	cd s3fs-c-feature-ommit-iam-role && \
  ./configure && \
  make && \
  make install && \
  apt-get purge -y build-essential automake libtool wget && \
	apt-get autoremove -y && \
	apt-get clean && \
	rm -rf /var/lib/apt/lists/* && \
  rm -rf /deploy

WORKDIR /


RUN \
  touch ~/.passwd-s3fs && \
  chmod 600 ~/.passwd-s3fs && \
  mkdir /leofsfolder

VOLUME /leofsfolder


COPY s3fs-config.sh /usr/local/bin/s3fs-config.sh

CMD ["/bin/bash", "/usr/local/bin/s3fs-config.sh"]
