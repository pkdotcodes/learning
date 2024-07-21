 #!/bin/bash

 #$# -- number of args that our script was run with 
 #$0 -- the filename of our script 
 #$1..$n -- script arguments 

 #what'S our filename?
 ourfilename=$0
 echo $ourfilename+

 # how many arguments was the cript called with?
num_arguments=$#

 # what were the arguments?
 echo "The first three arguments were ${1}, ${2}, ${3}"
