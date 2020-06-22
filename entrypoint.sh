#!/bin/sh -l
# Set field seperator
IFS="="

# Get the arguments that were passed
for var in "$@"
do
  echo "Variable is $var"
done

