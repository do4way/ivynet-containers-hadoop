FROM gcr.io/ivynet-containers/hadoop:2.8.1

ENV HDFS_CONF_dfs_namenode_name_dir=file:///hadoop/dfs/name
RUN mkdir -p /hadoop/dfs/name
VOLUME /hadoop/dfs/name

ADD run.sh /run.sh
run chmod a+x /run.sh

CMD ["/run.sh"]
