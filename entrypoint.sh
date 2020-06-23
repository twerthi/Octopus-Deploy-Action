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
      "pack-folder")
        packfolder=${argument[1]}
        ;;
      "pack-format")
        packformat=${argument[1]}
        ;;
      "artifact-folder")
        artifactfolder=${argument[1]}
        ;;
    esac
done

# Execute the selected command
case "$command" in
  "pack")
    # Check to see if packformat is emtpy
    if [ -z "$packformat" ]
    then
      packformat="Zip"
    fi
    /octo/octo pack --id "$packageid" --format "$packformat" --version "$version" --basePath "$packfolder" --outFolder "$artifactfolder"
    ;;
  "push")
    # Get file(s) specified
    #packageFiles=$(ls "$artifactfolder/$packageid")

    # Check to see if space was specified
    if [ -z "$spaceName" ]
    then
      spaceName="Default"
    fi

    # Loop through files
    for file in "$artifactfolder/$packageid"
    do
      /octo/octo push --id "$file" --server "$octopusserverurl" --apiKey "$octopusapikey" --space "$spaceName"
    done
    ;;
esac

#echo "Workdir is $GITHUB_WORKSPACE"

#echo "$(/octo/octo version)"