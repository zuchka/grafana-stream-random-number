!/bin/bash

readNextValue () {
  value=$(( value + (RANDOM % 10) -5 ))
  if ((value >= 100)); then
    value=10
  fi
  if ((value <= 0)); then
    value=0
  fi
  echo $value
}

while true; do
  readNextValue

  curl -POST http://admin:admin@localhost:3000/api/live/push/stream-random-numbers -d "system,device=randomA value=$value"
  
  sleep .05
done
