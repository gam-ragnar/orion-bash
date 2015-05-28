# orion-bash
This is an automated script for managing Orion

## How to use
Just copy paste the command below into parent directory where App will be a subfolder parent/appfolder(meteor)

`wget https://raw.githubusercontent.com/timfam/orion-bash/master/orion.sh  && chmod +x orion.sh `


## Add admin only
`./orion.sh admin themeName AppName` 
i.e 
`./orion.sh admin bootstrap football`
This will create meteor AppName and add the chosen package
There are currently 3 admin themes now
* bootstrap
* foundation 
* materialize

## Install full distribution
`./orion.sh dl distributionName AppName`
i.e `./orion.sh dl blog helpinghands`
This will install a full distribution
There are presently 1 distribution
* blog

##Adding extra packages
Extra packages are subsets of packages to ensures rapid development
* SEO
* Dev
* Compile tools
* And more
* 
## Add SEO Extras 
`./orion.sh extras AppName seo`
alias for 
`meteor add meteorhacks:inject-initial gadicohen:sitemaps gadicohen:robots-txt`
I will add more useful packages to the list as I find them

##Add Dev Extras
`./orion.sh extras AppName dev`
alias for
`meteor add audit-argument-checks manuel:viewmodel-explorer msavin:mongol msavin:jetsetter raix:handlebar-helpers jag:pince mquandalle:bower manuel:viewmodel dburles:factory anti:fake`

##Add Compilation tools Extras
`./orion.sh extras AppName compile`
alias for
`meteor add coffeescript mquandalle:jade mquandalle:stylus`

## Add Performance extras
`./orion.sh extras AppName perform`
##Switch admin
`orion.sh switch AppName themeName`
This removes other themes and adds the requested admin
