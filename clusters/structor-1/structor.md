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
  
# testing on structor vm
 

setting up the path

    export SLIDER_CONF_DIR=~/Projects/Hortonworks/Projects/clusterconfigs/clusters/structor-1/slider
    export HADOOP_CONF_DIR=${SLIDER_CONF_DIR}/../hadoop-conf
    
fish
    
    set -x SLIDER_BIN /Users/stevel/Projects/Hortonworks/Projects/slider/slider-assembly/target/slider-0.51.0-incubating-SNAPSHOT-all/slider-0.51.0-incubating-SNAPSHOT/bin
    
    set -x PATH $PATH $SLIDER_BIN
    
    set -gx SLIDER_CONF_DIR ~/Projects/Hortonworks/Projects/clusterconfigs/clusters/structor-1/slider
    set -gx HADOOP_CONF_DIR $SLIDER_CONF_DIR/../hadoop-conf
    
    echo $status
    
    slider resolve --path / --list
    

## Accumulo
    
    slider install-package --name ACCUMULO --package 
    slider list
    
    slider create acc1 --package accumulo-app-package.zip --template appconfig.json --resources resources.json 
    
    
## HBase

    slider create acc9 --resources resources.json --template appConfig.json 
    
    