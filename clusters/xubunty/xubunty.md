<!---
  Licensed under the Apache License, Version 2.0 (the "License");
  you may not use this file except in compliance with the License.
  You may obtain a copy of the License at

   http://www.apache.org/licenses/LICENSE-2.0

  Unless required by applicable law or agreed to in writing, software
  distributed under the License is distributed on an "AS IS" BASIS,
  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
  See the License for the specific language governing permissions and
  limitations under the License. See accompanying LICENSE file.
-->

# Xubunty

2.8.0-SNAPSHOT, manual build, no security.


## Building

```bash

mvn clean package -Pdist,native -DskipTests -Dmaven.javadoc.skip=true

mvn package -Pdist,native -DskipTests -Dmaven.javadoc.skip=true

```

# env vars on desktop

```bash

export HADOOP_YARN_USER=stevel
export HADOOP_HDFS_USER=stevel
export HADOOP_CONF_DIR=/home/stevel/Projects/clusterconfigs/clusters/xubunty/hadoop
export HADOOP_HOME=/home/stevel/hadoop_home
export HADOOP_YARN_HOME=$HADOOP_HOME
export YARN_CONF_DIR=$HADOOP_CONF_DIR
export HADOOP_HEAPSIZE=256
export JAVA_HEAP_MAX=-Xmx256m
export PATH=$PATH:$HADOOP_HOME/bin:$HADOOP_HOME/sbin

```




## Manual launch


```bash
start-dfs.sh
start-yarn.sh
yarn-daemon.sh start timelineserver

stop-dfs.sh
stop-yarn.sh
yarn-daemon.sh stop timelineserver

$HADOOP_YARN_HOME/sbin/yarn-daemon.sh start timelineserver



```


## Links

* [Timeline](http://xubunty:8188/applicationhistory)
* [Timeline API](http://xubunty:8188/ws/v1/timeline)
* [Spark Events](http://xubunty:8188/ws/v1/timeline/spark_event_v01)


## Test clients

```bash

set -gx PROJECTS /Users/stevel/Projects/Hortonworks/Projects
set -gx CLUSTER_DIR $PROJECTS/clusterconfigs/clusters/xubunty
set -gx SLIDER_CONF_DIR $CLUSTER_DIR/slider
set -gx HADOOP_CONF_DIR $CLUSTER_DIR/hadoop

ls -l $HADOOP_CONF_DIR

```


## Spark

```bash

set -gx SPARK_CONF_DIR $CLUSTER_DIR/spark
set -gx SPARK_DIST $PROJECTS/sparkwork/spark/dist/
set -gx SPARK_LIB $SPARK_DIST/lib
set -gx SPARK_HOME $SPARK_DIST

echo $SPARK_DIST

set -gx SV 1.6.1


set -gx HV hadoop2.8.0-SNAPSHOT

# or

set -gx HV 2.7.1-SNAPSHOT

set -gx SHV $SV-hadoop$HV; echo $SHV

set -gx SPARK_DEFAULT $SPARK_CONF_DIR/spark-defaults.conf


echo $SPARK_LIB/spark-examples-$SHV.jar
ls -l $SPARK_LIB/spark-examples-$SHV.jar

ls -l $SPARK_DEFAULT

## scp over the timeline plugin

set -gx PLUGIN yarn-timeline/yarn-timeline-ats-plugin/target/spark-yarn-timeline-ats-plugin_2.10-$SV.jar
ls -l $PLUGIN

scp $PLUGIN xubunty:hadoop_home/share/hadoop/yarn/lib/
```


### starting the history server

```

dist/sbin/start-history-server.sh

```

### Submitting work

```

bin/spark-submit --deploy-mode cluster \
--class org.apache.spark.examples.SparkPi \
--properties-file $SPARK_DEFAULT \
file://$SPARK_LIB/spark-examples-$V.jar 20

bin/spark-class org.apache.spark.deploy.SparkSubmit --deploy-mode client \
--class org.apache.spark.examples.SparkPi \
--properties-file $SPARK_CONF_DIR/spark-defaults.conf \
file://$SPARK_LIB/spark-examples-$V.jar 10


```
