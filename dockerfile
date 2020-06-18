# Use the Octopus Deploy CLI container
FROM octopusdeploy/octo

# Copy the script file in
COPY entrypoint.sh /entrypoint.sh

# Ensure file is executable
RUN ["chmod", "+x", "/entrypoint.sh"]

# Execute the script
ENTRYPOINT [ "/entrypoint.sh" ]