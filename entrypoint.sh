#!/bin/bash
# Set field seperator
IFS="="

# Get the arguments that were passed
for var in "$@"
do
    # Split the var
    read -a argument <<<"$var"
    # Assign variables
    case "${argument[0]}" in
      "command")
        command=${argument[1]}
        ;;
      "version")
        version=${argument[1]}
        ;;
      "package-id")
        packageid=${argument[1]}
        ;;
      "octopus-server-url")
        octopusserverurl=${argument[1]}
        ;;
      "octopus-apikey")
        octopusapikey=${argument[1]}
        ;;
      "space")
        spaceName=${argument[1]}
        ;;
    esac

done

echo "Command is: $command "
echo "Workdir is $GITHUB_WORKSPACE"
echo "$PWD"