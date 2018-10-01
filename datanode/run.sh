#!/bin/bash

strs=`echo $HDFS_CONF_dfs_datanode_data_dir | perl -pe 's#file://##'`
datadirs=`echo $strs | tr "," "\n"`
for datadir in $datadirs
do
    echo $datadir
    if [ ! -d $datadir ]; then
        echo "Datanode data directory not found: $datadir"
        exit 2
    fi
done

$HADOOP_PREFIX/bin/hdfs --config $HADOOP_CONF_DIR datanode
