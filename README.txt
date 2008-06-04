This directory is the root of all of the IMBI software sources, design documents, diagrams etc.

Contents:

datamodel
---------
this is where we put all ERD diagrams or data modelling design documents

excluded
--------
this is where our transformations store those rows that could not be parsed

input
-----
this is where we store the IMDB gzipped text files. These are downloaded here by the DOWNLOAD_IMDB_LISTS.kjb kettle job

kettle
-----
this is where we store kette job and transformation files

rejected
--------
this is where our transformations store those rows that were parsed correctly but rejected by the database

sql
---
this is where we keep the scripts to create the MySQL schemas
