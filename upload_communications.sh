#!/bin/zsh

# This scripts uploads the communications file into sql server 

## Upload the communications data
docker cp communications.csv serene_goldstine:/var/opt/mssql
docker cp communications.sql serene_goldstine:/var/opt/mssql

## Check if the upload was successful 
if [[ $? -ne 0 ]]
then
  echo 'Unable to upload the data' >&2
  exit 1
fi

## Run the sql script 
docker exec -it serene_goldstine /opt/mssql-tools/bin/sqlcmd -U sa -P "rashid@23" -i /var/opt/mssql/communications.sql

## Check if the execution was successful
if [[ $? -ne 0 ]]
then
  echo 'Unable to execute the sql script' >&2
  exit 1
fi


