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
  
# Actions to start hadoop on windows
 
## Env vars 
     
    set HADOOP_HOME=C:\bin\hadoop\
    set HADOOP_HEAPSIZE=256
    
    set CLUSTERDIR=C:\Work\clusterconfigs\clusters\morzine
    set HADOOP_CONF_DIR=C:\Work\clusterconfigs
    
    ﻿cd %HADOOP_HOME%
    
     
    hdfs namenode -format vm
    
 ## filesystem
 
     hdfs namenode -format vm


    start-dfs --config $HADOOP_CONF_DIR 
    start-yarn --config $HADOOP_CONF_DIR

## start all the services

    hdfs --config $HADOOP_CONF_DIR namenode start
    hdfs --config $HADOOP_CONF_DIR --script hdfs datanode start 
    yarn --config $HADOOP_CONF_DIR resourcemanager start 
    yarn --config $HADOOP_CONF_DIR nodemanager start 
    
    zookeeper-3.4.5/bin/zkServer.sh start
