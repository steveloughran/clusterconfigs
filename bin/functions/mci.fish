function mci --description 'Maven clean install'
  mvn clean install -DskipTests $argv
end

