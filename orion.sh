#!/bin/bash
# Orion automated script
#save arguements in array 
#
#

args=("$@")

getAdmin
getDist



# commands
# dl for git clone distribution
# usage orion dl distName
# 

function getAdmin {
  if [ ${args[0]} = "admin" ]; then 
    echo "only admim theme will be added ${args[1]}"
    meteor create ${args[1]}
    echo "cd into" ${args[1]}
    cd ${args[1]}
    echo "meteor remove insecure autopublish"
    meteor remove insecure autopublish
    meteor add orionjs:core twbs:bootstrap orionjs:bootstrap
    echo "start meteor"
    meteor 
  fi
}

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
  cd  ..
  fi
}

# else
#     echo "use a admin or dl "
#function quit {
#                exit
#            }
# function hello {
#      echo Hello!
#  }
#   hello
#   quit
#   echo foo 

# listDist = {
#   bootstrap:'twbs:bootstrap orionjs:bootstrap',
#   materialize:'materialize:materialize orionjs:materialize',
#   foundation: 'rwatts:orionjs-foundation ewall:foundation' ,
#   blog: getBlog()

# }

# s3 = ['fortawesome:fontawesome',  'orionjs:filesystem', 'orionjs:s3',  'orionjs:file-attribute ',  'orionjs:relationships', 'reywood:publish-composite', 'dburles:collection-helpers'];

# foundationExtras= ();
# getBlog = function(){
#   return `git clone https://github.com/orionjs/examples.git`
# }
