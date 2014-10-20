# Set Hadoop-specific environment variables here.

# The java implementation to use.  Required.
export JAVA_HOME=/usr/java/default
export HADOOP_HOME_WARN_SUPPRESS=1

# Hadoop Configuration Directory
export HADOOP_CONF_DIR=${HADOOP_CONF_DIR:-/etc/hadoop/conf}

# The maximum amount of heap to use, in MB. Default is 1000.
export HADOOP_HEAPSIZE=200

# Extra Java runtime options.  Empty by default.
export HADOOP_OPTS="-Djava.net.preferIPv4Stack=true ${HADOOP_OPTS}"

# Command specific options appended to HADOOP_OPTS when specified
export HADOOP_NAMENODE_OPTS="-server -Xmx300m -Dhadoop.security.logger=INFO,DRFAS -Dhdfs.audit.logger=INFO,DRFAAUDIT ${HADOOP_NAMENODE_OPTS}"

HADOOP_DATANODE_OPTS="-Xmx300m -Dhadoop.security.logger=ERROR,DRFAS ${HADOOP_DATANODE_OPTS}"

HADOOP_BALANCER_OPTS="-server -Xmx300m ${HADOOP_BALANCER_OPTS}"

export HADOOP_SECONDARYNAMENODE_OPTS="-server -Xmx300m -Dhadoop.security.logger=INFO,DRFAS -Dhdfs.audit.logger=INFO,DRFAAUDIT ${HADOOP_SECONDARYNAMENODE_OPTS}"

# The following applies to multiple commands (fs, dfs, fsck, distcp etc)
export HADOOP_CLIENT_OPTS="-Xmx200m ${HADOOP_CLIENT_OPTS}"

# Where log files are stored.  $HADOOP_HOME/logs by default.
export HADOOP_LOG_DIR=/var/log/hadoop/$USER

# History server logs
export HADOOP_MAPRED_LOG_DIR=/var/log/hadoop/$USER

# Where log files are stored in the secure data environment.
export HADOOP_SECURE_DN_LOG_DIR=/var/log/hadoop/$HADOOP_SECURE_DN_USER

# The directory where pid files are stored.
export HADOOP_PID_DIR=/var/run/pid/$USER
export HADOOP_SECURE_DN_PID_DIR=/var/run/pid/$HADOOP_SECURE_DN_USER

# History server pid
export HADOOP_MAPRED_PID_DIR=/var/run/pid/$USER

YARN_RESOURCEMANAGER_OPTS="-Dyarn.server.resourcemanager.appsummary.logger=INFO,RMSUMMARY"

# A string representing this instance of hadoop.
export HADOOP_IDENT_STRING="$USER"

# Use libraries from standard classpath
JAVA_JDBC_LIBS=""
#Add libraries required by mysql connector
for jarFile in `ls /usr/share/java/*mysql* 2>/dev/null`
do
  JAVA_JDBC_LIBS=${JAVA_JDBC_LIBS}:$jarFile
done
#Add libraries required by oracle connector
for jarFile in `ls /usr/share/java/*ojdbc* 2>/dev/null`
do
  JAVA_JDBC_LIBS=${JAVA_JDBC_LIBS}:$jarFile
done
#Add libraries required by nodemanager
MAPREDUCE_LIBS=/usr/lib/hadoop-mapreduce/*
TEZ_LIBS=/usr/lib/tez/*:/usr/lib/tez/lib/*:/etc/tez/conf
export HADOOP_CLASSPATH=${HADOOP_CLASSPATH}${JAVA_JDBC_LIBS}

