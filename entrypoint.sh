#!/bin/bash
# Set field seperator
IFS="="

# Get the arguments that were passed
for var in "$@"
do
  #read -ra argument <<< "$var"
  echo "Variable is $var"  
done

