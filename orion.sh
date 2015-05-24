#!/bin/bash
# Orion automated script
#save arguements in array 
# args=("$@")

if [ ${args[0]} = "dist"]; then 
  echo "grabbing your" ${args[1]}
  mkdir ${args[0]}
  cd ${args[0]}
  `git clone https://github.com/orionjs/examples.git`
  cd examples
  mv blog/* ..
  cd ..
  rm -rf examples
  cd  ..
else
    echo "args one is null"
fi



# meteor create ${args[0]}

# cd ${args[0]}
# echo "cd into" ${args[0]}
# meteor remove insecure autopublish
# echo "meteor remove insecure autopublish"
# meteor add orionjs:core twbs:bootstrap orionjs:bootstrap
# echo "start meteor"
# meteor 



# distribution = funtion( ${args[2]}){
#   ${args[1]} = null;
#   ${args[2]} = null;
#   function gitter(${args[1]})
#   {
#     if [ ${args[1]}=null ]; then 
#       echo "args one is null"
#     else
#       echo "there is value"
#     fi

#     }
#   }
  

# }

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
