#!/bin/bash

ROOT_DIR=$(pwd)

# Version of LexEVS to run against
LEXEVS_BRANCH=v6.5.2
LEXEVS_REPO=https://github.com/lexevs/lexevs.git

#Artifact builder that is stored in NCI's Dockerhub
LEXEVS_ARTIFACT_TAG=ncidockerhub.nci.nih.gov/lexevs/lexevs-artifact-builder:6.5.2

# Variable to be passed in to the artifact builder.  
# This tells the artifact build to only build the LexEVS codebase.
LEXEVS_BUILD_ONLY=YES

#*****************************************************************
# Remove artifact directories and recreate them fresh.
#*****************************************************************
#rm -rf $ROOT_DIR/build

#*****************************************************************
# Create artifact directories and recreate them fresh.
#*****************************************************************
#mkdir $ROOT_DIR/build
#mkdir $ROOT_DIR/build/lexevs

# Removal and creation of the build/lexevs directory is don in the
# Artifact build image.  It is run as root and has permission to
# remove/add directories.

#*****************************************************************
# Setup/Build LexEVS
#*****************************************************************
docker run --rm -e LEXEVS_BRANCH=$LEXEVS_BRANCH -e LEXEVS_REPO=$LEXEVS_REPO -e LEXEVS_BUILD_ONLY=$LEXEVS_BUILD_ONLY -v $ROOT_DIR/build/lexevs:/lexevs $LEXEVS_ARTIFACT_TAG

echo "LexEVS builder completed";

#*****************************************************************
# Start all of the LexEVS services in the docker-compose.yml file.
#*****************************************************************
echo "Starting LexEVS Services..."

docker-compose up
