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

## Contributing

If you intend deploy your modified version as system wide app, please commit your changes to a branch first, and open a PR.
