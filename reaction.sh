#!/bin/bash

# install CLI
npm install -g reaction-cli

# clone Reaction, install NPM dependencies
reaction init

# move into the new app directory
cd reaction

# start Reaction
reaction
# or
reaction run