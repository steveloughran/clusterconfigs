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

    set CLUSTERDIR=C:\Work\clusterconfigs\clusters\morzine
    set HADOOP_CONF_DIR=%CLUSTERDIR%\hadoop
    set SLIDER_CONF_DIR=%CLUSTERDIR%\slider
    set HADOOP_HEAPSIZE=192
    set YARN_HEAPSIZE=192
    cd %HADOOP_HOME%
    set OLDPATH=%PATH%
    set PATH=%HADOOP_HOME%\bin;%HADOOP_HOME%\sbin;%PATH%

### old path

C:\bin\cygwin64\bin;C:\bin\Python27\;C:\Windows\system32;C:\Windows;C:\Windows\System32\Wbem;C:\Windows\System32\WindowsPowerShell\v1.0\;c:\java\jdk7\bin;C:\Program Files\Microsoft Windows Performance Toolkit\;C:\apps\maven\bin;C:\apps\Git\cmd;c:\bin;C:\Program Files (x86)\MSBuild\12.0\Bin;C:\Program Files (x86)\Microsoft Visual Studio 10.0\VC\bin;C:\bin\cmake-2.8\bin;C:\bin\hadoop\bin;C:\bin\OpenSSL\bin;C:\Program Files\jEdit;%HADOOP_HOME%\bin;%HADOOP_HOME%\sbin



## Checks

    echo {%PATH%}
    echo {%HADOOP_HEAPSIZE%}
    echo {%HADOOP_HOME%}
    echo {%HADOOP_CONF_DIR%}
    dir %HADOOP_CONF_DIR%
    dir %SLIDER_CONF_DIR%


### filesystem

    hdfs namenode -format
    hdfs --config %HADOOP_CONF_DIR% namenode -format

These need the `start-dfs.cmd` and `start-yarn.cmd` files patched
to propagate configs

    start-dfs --config %HADOOP_CONF_DIR%
    start-yarn --config %HADOOP_CONF_DIR%

## start all the services

### HDFS

    hdfs --config %HADOOP_CONF_DIR% namenode
    hdfs --config %HADOOP_CONF_DIR% datanode

#### Checks

    http://localhost:50070/


    hdfs --config %HADOOP_CONF_DIR% dfs

    hdfs --config %HADOOP_CONF_DIR% dfs -chmod 777 /



### YARN

    yarn --config %HADOOP_CONF_DIR% resourcemanager
    yarn --config %HADOOP_CONF_DIR% nodemanager

    yarn --config %HADOOP_CONF_DIR%  application
    zookeeper-3.4.5/bin/zkServer.sh start
