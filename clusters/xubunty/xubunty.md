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

# Xubunty setup

manual, 2.8

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
