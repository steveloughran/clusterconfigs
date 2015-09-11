Plan

[ ] Build full local install with bin/ & c

   mvp -Pyarn -Phadoop-2.6
   bash make-distribution.sh  --skip-java-test -Pyarn -Phadoop-2.6
   
   
[ ] Spark working against local VM

```

https://spark.apache.org/docs/latest/configuration.html
set -gx HADOOP_HOME /Users/stevel/Projects/Hortonworks/Projects/clusterconfigs/clusters/devix
set -gx HADOOP_CONF_DIR /Users/stevel/Projects/Hortonworks/Projects/clusterconfigs/clusters/devix/conf

# for spark 1.5+

set -gx SPARK_CONF_DIR /Users/stevel/Projects/Hortonworks/Projects/clusterconfigs/clusters/devix/spark

# for the 1.4 branch
set -gx SPARK_CONF_DIR /Users/stevel/Projects/Hortonworks/Projects/clusterconfigs/clusters/devix/spark-1.4

set -gx SPARK_HOME /Users/stevel/Projects/Hortonworks/Projects/sparkwork/spark/dist/

bin/spark-submit --deploy-mode cluster \
--class org.apache.spark.examples.SparkPi \
--properties-file /Users/stevel/Projects/Hortonworks/Projects/clusterconfigs/clusters/devix/spark/spark-defaults.conf \
file:///Users/stevel/Projects/Hortonworks/Projects/spark/dist/lib/spark-examples-1.4.0-SNAPSHOT-hadoop2.6.0.jar

bin/spark-submit  \
--class org.apache.spark.examples.SparkPi \
--properties-file /Users/stevel/Projects/Hortonworks/Projects/clusterconfigs/clusters/devix/spark/spark-defaults.conf \
file:///Users/stevel/Projects/Hortonworks/Projects/sparkwork/spark/dist/lib/spark-examples-1.3.1-hadoop2.6.0.jar 20

dist/bin/spark-submit  \
  --class org.apache.spark.examples.SparkPi \
  --properties-file /Users/stevel/Projects/Hortonworks/Projects/clusterconfigs/clusters/devix/spark/spark-defaults.conf \
  file:///Users/stevel/Projects/Hortonworks/Projects/sparkwork/spark/dist/lib/spark-examples-1.5.0-SNAPSHOT-hadoop2.6.0.jar 20

dist/bin/spark-submit  \
  --class org.apache.spark.examples.SparkPi \
  --properties-file /Users/stevel/Projects/Hortonworks/Projects/clusterconfigs/clusters/devix/spark/spark-defaults.conf \
  file:///Users/stevel/Projects/Hortonworks/Projects/sparkwork/spark/dist/lib/spark-examples-1.5.0-SNAPSHOT-hadoop2.6.0.jar 20


dist/bin/spark-submit  \
  --verbose \
  --deploy-mode cluster \
  --class org.apache.spark.examples.SparkPi \
  file:///Users/stevel/Projects/Hortonworks/Projects/sparkwork/spark/dist/lib/spark-examples-1.5.0-SNAPSHOT-hadoop2.6.0.jar 20


lib/spark-examples-1.4.0-SNAPSHOT-hadoop2.6.0.jar

```  
[ ] Submit sample jobs: success, failure; view



[ ] use history settings to talk to ATS
[ ] see what happens

~/bin/ssh-in -i ec2-keypair  root@ec2-54-88-120-96.compute-1.amazonaws.com

/etc/security/keytabs

scp-in -i ~/.ssh/hwx-ec2.private root@ec2-54-88-120-96.compute-1.amazonaws.com:/etc/security/keytabs .
http://ec2-54-88-120-96.compute-1.amazonaws.com:8188/ws/v1/timeline/spark_event_v01/