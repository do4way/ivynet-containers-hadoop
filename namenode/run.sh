#!/bin/bash

namedir=`echo $HDFS_CONF_dfs_namenode_name_dir | perl -pe 's#file://##'`
if [ ! -d $namedir ]; then
    echo "Namenode name directory not found: $namedir"
    exit 2
fi

if [ -z "$CLUSTER_NAME" ]; then
    echo "Cluster name not specified"
    exit 2
fi

if [ "`ls -A $namedir`" == "" ] || [ "`ls -A $namedir`" == "lost+found" ]; then
    echo "Formatting namenode name directory: $namedir"
    $HADOOP_PREFIX/bin/hdfs --config $HADOOP_CONF_DIR namenode -format -force $CLUSTER_NAME
fi

$HADOOP_PREFIX/bin/hdfs --config $HADOOP_CONF_DIR namenode
