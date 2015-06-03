# DOWNLOAD\_IMDB\_LISTS.kjb #

The DOWNLOAD\_IMDB\_LISTS.kjb file defines a kettle job to download all the gzipped imdb lists.

# Purpose #

This job fetches the remote lists to the local machine where the job is running. Perhaps it would be better to have an individual job that first downloads only one list and then kicks off the transformation to process that one list, and we may move in that direction in the future. However, for now it is convenient to be able to periodically fetch all lists at once.

# Design #
Design is extremely simple. There is just one "Get File With FTP" job entry. This pulls /pub/misc/movies/database from the host ftp.fu-berlin.de

The files to fetch are specified as: .**\.list\.gz
(The backslashes before the dots are here to make the dot be seen as a literal dot. In DOS wildcard it would look like:**.list.gz

The target direcory is defined as ${Internal.Job.Filename.Directory}/../input. The variable ${Internal.Job.Filename.Directory} is the directory where the kettle job itself resides. So, the fetched files are put in the input directory which is a sibling of the directory where the current job resides.