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
      "project")
        project=${argument[1]}
        ;;
    esac
done

# Check to see if space was specified
if [ -z "$spaceName" ]
then
  spaceName="Default"
fi

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
    # Loop through files
    for file in $artifactfolder/$packageid
    do
      /octo/octo push --package "$file" --server "$octopusserverurl" --apiKey "$octopusapikey" --space "$spaceName"
    done
    ;;
  "create-release")
    # Create a release for the specified project
    /octo/octo "create-release --project '$project' --version '$version' --server '$octopusserverurl' --apiKey '$octopusapikey' --space '$spaceName'"
    ;;
  "deploy-release")
    # Deploy a release
    ;;
esac