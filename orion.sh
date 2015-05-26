#!/bin/bash
# Orion automated script that allows you to install either admin or full distribution from shell

#save passed arguements in array 
args=("$@")

#function that checks chosen distribution exist called further down
function checkDist {
  case ${args[1]} in 
    blog) echo "grabbing your" ${args[1]} 
    mkdir ${args[2]}
    cd ${args[2]}
    `git clone https://github.com/orionjs/examples.git `
    cd examples
    shopt -s dotglob
    `sudo mv ${args[1]}/* ..`
    cd ..
    rm -rf examples
    echo "cd ${args[2]}";;
    *) echo "please enter a valid distribution";;
  esac
}
# setup meteor called in checkAdmin
function meteorSetup {
  meteor create ${args[2]}
  echo "cd  ${args[2]}"
  cd ${args[2]}
  echo "meteor remove insecure autopublish"
  meteor remove insecure autopublish
  meteor add orionjs:core
  }
#function that checks chosen admin theme exist called further down
function checkAdmin {
  case ${args[1]} in 
    bootstrap) echo "setting up Bootstrap theme"
    meteorSetup
    meteor add twbs:bootstrap orionjs:bootstrap
    echo "cd ${args[2]}";;
    foundation) echo "setting up foundation theme"
    meteorSetup
    meteor add ewall:foundation rwatts:orionjs-foundation
    echo "cd ${args[2]}";;
    materialize) echo "setting up materialize theme"
    meteorSetup
    meteor add materialize:materialize orionjs:materialize
    echo "cd ${args[2]}";;
    *) echo "please enter a valid admin theme";;
  esac
}

#Grab admin theme
# i.e orion.sh admin bootstrap AppName 
function getAdmin {
  if [ ${args[0]} = "admin" ]; then 
    checkAdmin
  fi
}
# # grab Orion Distribution
# # orion.sh dl DistributionName
function getDist {
  if [ ${args[0]} = "dl" ]; then 
  checkDist
  fi
}

# instantiate bash
getAdmin
getDist

