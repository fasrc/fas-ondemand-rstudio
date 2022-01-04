# Rstudio Server  for Deployment on the Academic cluster at FAS-RC

This app was derived from [bc_osc_rstudio_server](https://github.com/OSC/bc_osc_rstudio_server), a template kindly provided by the [OSC OpenOnDemand](https://github.com/OSC/ondemand)
Team. 

It launches a Rstudio server within a batch job.

## Prerequisites

[Singularity](http://singularity.lbl.gov/) is required as the software will be run as a singularity container.

The container is based on [rocker verse](https://hub.docker.com/r/rocker/verse), which is part of the [rocker project](https://www.rocker-project.org/).

We are also icluding in the reference image a number of system packages from [Bioconductor docker containers](https://github.com/Bioconductor/bioconductor_docker/blob/master/Dockerfile) which should guarantee that we have a good number of potential dependencies already satisfied in case students will need to build other packages. See [Bioconductor docker help](https://www.bioconductor.org/help/docker/) for additional details.

## Install

The master branch of this repo is automatically deployed by **puppet** to /var/www/ood/apps/sys/ on the ondemand nodes.

## Development

To make changes in a development environment, login to OnDemand and start a shell session and then follow these instructions:

```sh
# create the development folder if you still not have one
mkdir -pv $HOME/fasrc/dev/
cd $HOME/fasrc/dev/

# clone the repository in a subfolder for your version of the app
git clone https://github.com/fasrc/fas-ondemand-rstudio.git

# Change the working directory to this new directory
cd fas-ondemand-rstudio
```

Once that's done, you can run your version of the app from the sandbox control panel under the *dev* menu on the ondemand dashboard.

See also:
- https://osc.github.io/ood-documentation/latest/app-development.html 

## Updating the docker image

Note that any updates pushed to the `Dockerfile` will trigger a Github Action that builds a new image and pushes it to the [harvardat](https://hub.docker.com/u/harvardat) organization based on the current branch name. In the case of the `master` branch, the new docker image will be pushed to [harvardat/rstudio-master](https://hub.docker.com/r/harvardat/rstudio-master).

To build manually:

```sh
$ docker build -t harvardat/rstudio-master:latest .
```

To run the image:

```
$ docker run --rm -p 8787:8787 -e PASSWORD=yourpasswordhere harvardat/rstudio-master:latest
```

If you intend to push the image to docker hub, it must be tagged with the git commit:

```sh
$ export GIT_COMMIT_HASH=$(git log -1 --format=%h)
$ docker tag harvardat/rstudio-master:latest harvardat/rstudio-master:$GIT_COMMIT_HASH
$ docker push harvardat/rstudio-master:$GIT_COMMIT_HASH
$ docker push harvardat/rstudio-master:latest
```

To obtain a list of installed packages, first create `list_installed.R`:

```sh
$ cat << '__EOF' >list_installed.R
ip <- as.data.frame(installed.packages()[,c(1,3:4)])
rownames(ip) <- NULL
ip <- ip[is.na(ip$Priority),1:2,drop=FALSE]
print(ip, row.names=FALSE)
__EOF
```

And then run the image and execute the R script:

```sh
$ docker run --rm -i harvardat/rstudio-master:latest R <list_installed.R
```


## Contributing

If you intend deploy your modified version as system wide app, please commit your changes to a branch first, and open a PR.
