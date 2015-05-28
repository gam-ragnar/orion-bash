#!/bin/bash -x
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

#Get extra packages
function addExtras {
  meteor add coffeescript mquandalle:jade
}
#Grab admin theme
# i.e orion.sh admin bootstrap AppName 
function Admin {
  if [ ${args[0]} = "admin" ]; then 
    checkAdmin
  fi
}
# # grab Orion Distribution
# # orion.sh dl DistributionName
function Dist {
  if [ ${args[0]} = "dl" ]; then 
    checkDist
  fi
}

#grab top seo packages
function getExtras {
  case ${args[2]} in 
    seo) echo "setting up seo packages"
    meteor add meteorhacks:inject-initial gadicohen:sitemaps gadicohen:robots-txt
#meteorhacks:ssr
;;
    dev) echo "setting up dev tools"
    meteor add audit-argument-checks manuel:viewmodel-explorer msavin:mongol msavin:jetsetter raix:handlebar-helpers jag:pince mquandalle:bower manuel:viewmodel dburles:factory anti:fake
  ;;
  compile) echo "setting up compilation tools"
    meteor add coffeescript mquandalle:jade mquandalle:stylus
    ;;
  perform) echo "setting up performance"
  meteor add meteorhacks:subs-manager meteorhacks:inject-initial
  esac
}
#sample ./orion.sh extras AppName seo
#this will cd into app and add group of packages
function Extras {
  if [ ${args[0]} = "extras" ]; then 
    cd ${args[1]}
    getExtras
  fi
}

#Switch theme packages
function switchTheme {
  local BS="twbs:bootstrap orionjs:bootstrap"
 local FOU="ewall:foundation rwatts:orionjs-foundation"
 local MAT="materialize:materialize orionjs:materialize" 
  case ${args[2]} in 
    foundation) echo "switching to foundation"
      meteor remove $BS $MAT
      meteor add $FOU
;;
    bootstrap) echo "switching to bootstrap tools"
      meteor remove $MAT $FOU
      meteor add $BS
  ;;
  materialize) echo "switching to materialize"
    meteor remove $BS $FOU
    meteor add $MAT
    ;;
  performance) echo "setting up performance"
  meteor add meteorhacks:subs-manager meteorhacks:inject-initial
  esac
}
#this will cd into app and remove old theme then add new one
function Switch {
  if [ ${args[0]} = "switch" ]; then 
    cd ${args[1]}
    switchTheme
  fi
}
# instantiate bash
Admin
# orion.sh dl DistributionName
Dist
#sample ./orion.sh extras seo AppName
Extras
# orion.sh switch AppName themeName
Switch

