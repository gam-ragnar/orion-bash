#!/bin/bash
# Orion automated script
#save arguements in array 
args=("$@")

# commands
# dl for git clone distribution
# usage orion dl distName

function meteorStart {
  echo "start meteor"
  meteor 
}
#Grab admin theme
#orion admin bootstrap
function getAdmin {
  if [ ${args[0]} = "admin" ]; then 
    echo "only admim theme will be added ${args[1]}"
    meteor create ${args[1]}
    echo "cd into" ${args[1]}
    cd ${args[1]}
    echo "meteor remove insecure autopublish"
    meteor remove insecure autopublish
    meteor add orionjs:core twbs:bootstrap orionjs:bootstrap
    meteorStart  
  fi
}
# grab Orion Distribution
# orion dl blog
function getDist {
  if [ ${args[0]} = "dl" ]; then 
  echo "grabbing your" ${args[1]}
  mkdir ${args[1]}
  cd ${args[1]}
  `git clone https://github.com/orionjs/examples.git`
  cd examples
  shopt -s dotglob
  `sudo mv blog/* ../`
  cd ..
  rm -rf examples
  cd  ${args[1]}
  meteorStart 
  fi
}


getAdmin
getDist

