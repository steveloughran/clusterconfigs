function mvnsite --description 'mvnsite'
  mvn site:site -Dmaven.javadoc.skip=true  -DskipTests $argv
end