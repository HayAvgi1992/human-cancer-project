#!/bin/bash

# create dataset inside a project
bq mk human-cancer-project:openalex

# create tables
bq mk --table human-cancer-project:openalexDemo.publishers publishers:string
bq mk --table human-cancer-project:openalexDemo.sources sources:string
bq mk --table human-cancer-project:openalexDemo.institutions institutions:string
bq mk --table human-cancer-project:openalexDemo.authors author:string
bq mk --table human-cancer-project:openalexDemo.concepts concepts:string
bq mk --table human-cancer-project:openalexDemo.works work:string
bq mk --table human-cancer-project:openalexDemo.funders funders:string


# load data to table
for data_file in openalex-snapshot/data/publishers/*/*.gz;
do
    bq load --source_format=CSV -F '\t' \
        --schema 'publishers:string' \
        --project_id human-cancer-project \
        openalexDemo.publishers $data_file;
done

for data_file in openalex-snapshot/data/sources/*/*.gz;
do
    bq load --source_format=CSV -F '\t' \
        --schema 'sources:string' \
        --project_id human-cancer-project \
        openalexDemo.sources $data_file;
done

for data_file in openalex-snapshot/data/institutions/*/*.gz;
do
    bq load --source_format=CSV -F '\t' \
        --schema 'institutions:string' \
        --project_id human-cancer-project \
        openalexDemo.institutions $data_file;
done

for data_file in openalex-snapshot/data/funders/*/*.gz;
do
    bq load --source_format=CSV -F '\t' \
        --schema 'funders:string' \
        --project_id human-cancer-project \
        openalexDemo.funders $data_file;
done

for data_file in openalex-snapshot/data/concepts/*/*.gz;
do
    bq load --source_format=CSV -F '\t' \
        --schema 'concepts:string' \
        --project_id human-cancer-project \
        openalexDemo.concepts $data_file;
done

for data_file in openalex-snapshot/data/authors/*/*.gz;
do
    bq load --source_format=CSV -F '\t' \
        --schema 'authors:string' \
        --project_id human-cancer-project \
        openalexDemo.authors $data_file;
done

for data_file in openalex-snapshot/data/works/*/*.gz;
do
    bq load --source_format=CSV -F '\t' \
        --schema 'works:string' \
        --project_id human-cancer-project \
        openalexDemo.works $data_file;
done
