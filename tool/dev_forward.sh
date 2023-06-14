#!/usr/bin/env bash 


start_proxy ()
{
  passwd='ddgj1301'
  targetHost='sport@192.168.31.10'
  # ports="8080 8081 3306 8085"
  ports=$1

  printf "Port forwarding: %s \n" "$ports"
  for  port in $ports 
  do

  if ! pgrep -lf "ssh -NL $port" > /dev/null 2>&1; then 
    sshpass -p $passwd ssh -NL "$port:localhost:$port" $targetHost &
  else 
    printf "%s already in use...\n" "$port"
  fi

  done

  echo "----RST:-----"
  show_proxy
}

stop_proxy ()
{
  # pgrep 'ssh' | xargs kill 
  printf "Killing port forwarding: \n"
  pgrep -lf 'ssh -NL'
  ports=$1

  if [ -z "$ports" ]; then
    if pgrep -lf "z ssh -NL" > /dev/null 2>&1; then 
      pgrep -f "z ssh -NL" | xargs -r kill
    fi
  else
    for port in $ports 
    do
      if pgrep -lf "z ssh -NL $port" > /dev/null 2>&1; then 
        pgrep -f "z ssh -NL $port" | xargs -r kill
      fi
    done 
  fi

  # pgrep -f 'ssh -NL' | xargs kill
  echo "----RST:-----"
  show_proxy
}

show_proxy()
{
  # ps aux | grep 'ssh -NL' | grep -v grep | awk '{print $1, $2, $11, $12, $13, $14, $15, $16}'
  # ps aux | grep -v awk | grep -v sshpass | awk '/ssh -NL/{print $1, $2, $11, $12, $13,$14}'
  # pgrep -l 'ssh'
  echo "CURRENT PORT FORWARDING:"
  pgrep -lf 'ssh -NL'
}

####################
# Help
####################
help ()
{
  echo "A proxy tool for connected to dev env."
  echo 
  echo "Syntax: $(basename "$0") -m [start|stop|show] -p-h"
  echo "START MODE OPTIONS"
  echo "-m=show Swtich run mode[start|stop|show]"
  echo -e "\tstart     Starting four port forwarding to local"
  echo -e "\tstop      Stoping port forwarding"
  echo -e "\tshow      Showing current port forwarding"
  echo "-p PORTS which port forwarding, '8080 8081 8082'"

}

if [[ $# -lt 1 ]]; then
  show_proxy
  exit 0
fi

if [[ "$1" == "-h" || "$1" == "--help" ]]; then
  help 
  exit 0
fi

while getopts 'm:p:' flag; do
  case "${flag}" in
    m) mode=${OPTARG};;
    p) port=${OPTARG};;
    *)
      help
      exit;;
  esac
done

if [[ ! "$mode" ]]; then
  mode="show" 
fi

case "$mode" in
  "start") 
    if [[ ! "$port" ]]; then
      echo "Invalid port"
      exit 1
    fi
    start_proxy "$port"
    ;;
  "stop") 
    stop_proxy "$port"
    ;;
  "show")
    show_proxy
    ;;
  *) 
    echo 'Error: invalid [m] argument'
    help
    exit 1
    ;;
esac
