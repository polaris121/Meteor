# Use an official Node.js runtime as a parent image
FROM node:14

# Set the working directory in the container
WORKDIR /usr/src/app

# Install Meteor
RUN npm install -g meteor

# Copy the application source code to the container
COPY . .

# Build the application
# This will create a Node.js application in the 'bundle' directory
RUN meteor build --directory .

# Set the entrypoint to run the application
WORKDIR /usr/src/app/bundle
RUN npm install

# Make port 3000 available to the world outside this container
EXPOSE 3000

# Define the command to run the app
CMD ["node", "main.js"]
