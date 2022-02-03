# Retrieving Data from Docker
Sharing a directory with a Docker container is easy, getting the permissions right is not. 
The main problem are the permissions that are set under Linux, if a directory is created through Docker. 
Users calling Docker will only have permissions, if they have permissions to execute Docker; if `sudo` is used, the directory will belong to root.

To prevent this issue, it is necessary to deliver the directory, in which data is stored, with the repository. 
However, git - by default - does not track empty directories, thus, a corresponding [.gitignore](.gitignore) file has to be created.
