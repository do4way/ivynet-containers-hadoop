FROM ubuntu:16.04

#  update repositories
RUN \
  sed -i 's/# \(.*multiverse$\)/\1/g' /etc/apt/sources.list && \
  apt-get update && \
  apt-get -y upgrade && \
  apt-get install -y --no-install-recommends openjdk-8-jre-headless ca-certificates-java net-tools curl && \
  rm -rf /var/lib/apt/lists/*

ENV JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64/

RUN apt-get update && \
  apt-get install -y --no-install-recommends net-tools curl

ENV HADOOP_VERSION 2.8.1
ENV HADOOP_URL https://www.apache.org/dist/hadoop/common/hadoop-$HADOOP_VERSION/hadoop-$HADOOP_VERSION.tar.gz
ENV HADOOP_KEY_URL https://dist.apache.org/repos/dist/release/hadoop/common/KEYS
RUN set -x \
  && curl -fSL "$HADOOP_URL" -o /tmp/hadoop.tar.gz \
  && curl -fSL "$HADOOP_URL.asc" -o /tmp/hadoop.tar.gz.asc \
  && curl -fSL "$HADOOP_KEY_URL" -o /tmp/hadoop-keys \
  && gpg --import /tmp/hadoop-keys \
  && gpg --verify /tmp/hadoop.tar.gz.asc \
  && tar -xvf /tmp/hadoop.tar.gz -C /opt/ \
  && rm /tmp/hadoop.tar.gz*

RUN ln -s /opt/hadoop-$HADOOP_VERSION/etc/hadoop /etc/hadoop
RUN cp /etc/hadoop/mapred-site.xml.template /etc/hadoop/mapred-site.xml
RUN mkdir /opt/hadoop-$HADOOP_VERSION/logs

ENV HADOOP_PREFIX=/opt/hadoop-$HADOOP_VERSION
ENV HADOOP_CONF_DIR=/etc/hadoop
ENV MULTIHOMED_NETWORK=1

ENV USER=root
ENV PATH $HADOOP_PREFIX/bin/:$PATH

ADD entrypoint.sh /entrypoint.sh
RUN chmod a+x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
