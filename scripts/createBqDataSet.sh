#!/bin/bash

# create dataset inside a project
bq mk human-cancer-project:openalex
# create table
bq mk --table human-cancer-project:openalexDemo.publishers publishers:string

# load data to table
for data_file in openalex-snapshot/data/publishers/*/*.gz;
do
    bq load --source_format=CSV -F '\t' \
        --schema 'publishers:string' \
        --project_id human-cancer-project \
        openalexDemo.publishers $data_file;
done