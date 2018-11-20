FROM gcr.io/ivynet-containers/hadoop:2.8.5

ENV HDFS_CONF_dfs_datanode_data_dir=file:///hadoop/dfs/data,/hadoop/dfs/data01,/hadoop/dfs/data02
RUN mkdir -p /hadoop/dfs/data
RUN mkdir -p /hadoop/dfs/data01
RUN mkdir -p /hadoop/dfs/data02
VOLUME /hadoop/dfs/data
VOLUME /hadoop/dfs/data01
VOLUME /hadoop/dfs/data02

ADD run.sh /run.sh
RUN chmod a+x /run.sh

CMD ["/run.sh"]
