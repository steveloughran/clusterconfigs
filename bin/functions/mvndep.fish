function mvndep --description 'mvn dependency:tree -Dverbose'
  mvn dependency:tree -Dverbose $argv
end