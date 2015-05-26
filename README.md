# orion-bash
This is an automated script for installing either an Orion distribution or admin.

## How to use
Just copy paste the command below
`wget https://raw.githubusercontent.com/timfam/orion-bash/master/orion.sh \
&& chmod +x orion.sh `

Then install the distribution or Admin you want.

## Install admin only
`./orion.sh admin themeName AppName` 
i.e 
`./orion.sh admin bootstrap football`
There are currently 3 admin themes now
* bootstrap
* foundation 
* materialize

## Install full distribution
`./orion.sh dl distributionName AppName`
i.e `./orion.sh dl blog helpinghands`
There are presently 1 distribution
* blog

##Setting correct permmission
orion.sh must be made executed before you can run this script.
`chmod +x orion.sh`
