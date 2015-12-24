# various commands for testing against Devix

setting up the path

### bash

```
export SLIDER_CONF_DIR=~/Projects/Hortonworks/Projects/clusterconfigs/clusters/devix/slider
export HADOOP_CONF_DIR=${SLIDER_CONF_DIR}/../hadoop-conf
```

## fish

```
set -gx SLIDER_VERSION 0.90.0-incubating-SNAPSHOT
set -gx PROJECTS /Users/stevel/Projects/Hortonworks/Projects
set -gx BASEDIR $PROJECTS/slider/
set -gx SLIDER_BIN $BASEDIR/slider-assembly/target/slider-$SLIDER_VERSION-all/slider-$SLIDER_VERSION/bin

set -gx PATH $PATH $SLIDER_BIN
set -gx HADOOP_JAAS_DEBUG true

slider version

set -gx CLUSTER_DIR $PROJECTS/clusterconfigs/clusters/devix
set -gx SLIDER_CONF_DIR $CLUSTER_DIR/slider
set -gx HADOOP_CONF_DIR $CLUSTER_DIR/conf

echo $status

slider version

slider resolve --path / --list -S java.security.auth.login.config=$SLIDER_CONF_DIR/jaas.conf

```

testrun

```
mvit -Dslider.conf.dir=$SLIDER_CONF_DIR -Dit.test=DiagnosticsCommandIT

mvit -Dslider.conf.dir=$SLIDER_CONF_DIR -Dit.test=ListCommandIT

// deploy app & web client
mvit -Dslider.conf.dir=$SLIDER_CONF_DIR -Dit.test=AgentWebPagesIT
```


