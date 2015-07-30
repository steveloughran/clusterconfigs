function mvcp --description 'Maven clean package'
  mvn clean package -DskipTests $argv
end