
# mvn integration-test -Dslider.conf.dir=../clusters/sandbox/slider -Dit.test=HBaseClusterLifecycleIT
function mvit --description 'mvn integration test'
  mvn integration-test $argv
end