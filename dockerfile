# Use the Octopus Deploy CLI container
FROM octopusdeploy/octo

# Copy the script file in
COPY entrypoint.sh /entrypoint.sh

# Ensure file is executable
RUN ["chmod", "+x", "/entrypoint.sh"]

# Add bash to container
RUN apk add --no-cache bash

# Add jq to container
RUN apk add --no-cache jq

# Execute the script
ENTRYPOINT [ "/entrypoint.sh" ]