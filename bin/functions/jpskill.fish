
function jpskill --description 'kill java processes'
  jps -l | grep $argv | awk '{print $1}' | xargs kill -9
end
