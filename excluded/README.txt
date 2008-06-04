This is the excluded directory. 

Our transformations in the kettle/lists dir create a log to store those rows from the raw imdb text files that could not be parsed. 
The name of the log for a transformation is:

<list-name>.txt

Note that this directory is under version control, but it's contents should not be!
By putting this dir under version control, it is easy to get an up an running system directly by checking out the repository.
The transformations will not run if the directory does not yet exist, which is why we put it under version control.
(there may be better ways to do this)