# Docker Files

This directory contains the files that are required to run the Docker container.

## Permission Fix
To fix permission issues that occur in Docker environments under Linux, two files are required: [`fix-perms.sh`](fix-perms.sh) and [`entypoint.sh`](entrypoint.sh).

These files should remain unaltered and are automatically copied to the Docker container.

## Execution
The [`execute.sh`](execute.sh) script can be adjusted to run the program that should be executed by the Docker container.