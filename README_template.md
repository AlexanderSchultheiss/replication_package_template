> This file should be adjusted to fit your own replication package.


> You can include various badges. Uncomment to see them.

[//]: ![Maven](https://github.com/AlexanderSchultheiss/RaQuN/actions/workflows/maven.yml/badge.svg)

[//]: [![Javadoc](https://img.shields.io/badge/Javadocs-online-blue.svg?style=flat)](https://alexanderschultheiss.github.io/RaQuN/docs/)

[//]: [![GitHubPages](https://img.shields.io/badge/GitHub%20Pages-online-blue.svg?style=flat)](https://alexanderschultheiss.github.io/RaQuN/)

[//]: [![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.5150388.svg)](https://doi.org/10.5281/zenodo.5150388)

# PROTOTYPE_NAME

PROTOTYPE_NAME is a .... This repository comprises the artifacts for our paper
_..._ which we presented at the
....
Authors:
...

### Cite As
```bibtex
@inproceedings{SBG+:MODELS21,
	author = ...,
	title = ...,
	booktitle = ...,
	location = ...,
	publisher = ...,
	year = ...,
	month = ...,
	keywords = ...
}
```

### Contact
Please contact ... if you have any questions:
* Mail: ...
* Discord: ...

## Obtaining the Artifacts
Clone the repository to a location of your choice using [git](https://git-scm.com/):
  ```
  git clone ...
  ```

## Project Structure
The project contains a number of files and folders with interesting content.

* [`docker-resources`](docker-resources) contains the script and property files used by the Docker containers.
    * ...
* [`experimental_subjects`](experimental_subjects) contains the ...
* [`result_analysis_python`](result_analysis_python) contains the Python scripts which we used to evaluate the experiments' results
  and generate the plots and tables for our paper.
* [`src`](src/main/java/de/variantsync/matching) contains the source files used to run the experiments, and the source files
  of the different matchers that we evaluated.
* [`EXPERIMENTS.md`](EXPERIMENTS.md) contains detailed instructions on how to run and configure experiments with and without Docker. You can find basic instructions in the sections below.
* [`INSTALL.md`](INSTALL.md) contains detailed instructions on how to prepare the artifacts for running on your system.
* [`LICENSE.md`](LICENSE.md) contains licensing information.
* [`REQUIREMENTS.md`](REQUIREMENTS.md) contains the requirements for installing and running the artifacts on your system.
* [`STATUS.md`](STATUS.md) specifies the [ACM badges](https://www.acm.org/publications/policies/artifact-review-and-badging-current)
  which we apply for.
* [`execute.bat`](experiment.bat)|[`execute.sh`](experiment.sh)is a script for running the experiments in a Docker container. See the `Running the Experiments` section below.
* `reported-results.zip` is an archive with the raw result data reported in our paper.
* [`stop-all-experiments.bat`](stop-all-experiments.bat)|[`stop-all-experiments.sh`](stop-all-experiments.sh) is a script that will stop all Docker containers currently running experiments.

## Requirements and Installation

### Setup Instructions
* Install [Docker](https://docs.docker.com/get-docker/) on your system and start the [Docker Daemon](https://docs.docker.com/config/daemon/).
* Open a terminal and navigate to the project's root directory
* Build the docker image by calling docker in your terminal:
```shell
docker build -t experiments .  
```

* You can validate the simulation by calling the validation corresponding to your OS. The validation should take a few minutes depending on your system.
  ```shell
  # Windows:
  .\execute.bat validate
  # Linux | MacOS
  docker run --rm -v "container-files":"/home/user/output" experiments validate
  ```

## Running the Experiments Using Docker
* All commands in this section are assumed to be executed in a terminal with working directory at project root.
* You can stop the execution of any experiment by running the following command in another terminal:
  ```shell
  # Windows:
  .\stop-execution.bat
  # Linux | MacOS
  docker stop $(docker ps -a -q --filter "ancestor=experiments")
  # or with sudo
  sudo docker stop $(sudo docker ps -a -q --filter "ancestor=experiments")
  ```
Stopping the simulation may take a moment.

### Running the Complete Simulation
You can repeat the simulation exactly as presented in our paper. ...
```shell
docker run --rm -v "$(pwd)/container-files":"/home/user/output" experiments validate
```
```
Expected runtime for the simulation: 10-30 days depending on the used hardware
```

### Result Evaluation
You can run the result evaluation by calling the simulation  with `evaluate`:
```shell
docker run --rm -v "container-files":"/home/user/output" experiments evaluate
```
`Expected Average Runtime: several seconds to a few minutes`
The script will generate figures similar to the ones presented in our paper.

### Clean-Up
The more experiments you run, the more space will be required by Docker. The easiest way to clean up all Docker images and
containers afterwards is to run the following command in your terminal. Note that this will remove all other containers and images
not related to the simulation as well:
```
docker system prune -a
```
Please refer to the official documentation on how to remove specific [images](https://docs.docker.com/engine/reference/commandline/image_rm/) and [containers](https://docs.docker.com/engine/reference/commandline/container_rm/) from your system.
