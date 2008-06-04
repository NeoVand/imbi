This is the input directory. 

This is where we store the zipped imdb text files. These are downloaded here by the kettle/lists/DOWNLOAD_IMDB_LISTS.kjb job

Note that this directory is under version control, but it's contents should not be!
By putting this dir under version control, it is easy to get an up an running system directly by checking out the repository.
The job and trasformations will not run if the directory does not yet exist, which is why we put it under version control.
(there may be better ways to do this)