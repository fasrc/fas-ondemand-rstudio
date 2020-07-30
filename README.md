# Rstudio Server  for Deployment on the Academic cluster at FAS-RC

## WIP : this is still work in progress, not ready for production deployment 

This app has been derived by the template kindly provided by the OSC OpenOnDemand
Team. [OSC](https://github.com/OSC/bc_osc_rstudio_server)

It launches a Rstudio server within a batch job.

## Prerequisites

The software will be run as a singularity container. 
As base for our container we will use [Bioconductor docker containers](https://hub.docker.com/r/bioconductor/bioconductor_docker), which are based off images from the rocker project [rockerdev](https://hub.docker.com/r/rockerdev/rstudio).
As reference for bioconductor [this is the main project page](https://www.bioconductor.org/help/docker/).


Using those as base containers should guarantee that we have a large amount of dependencies already satisfied.

## Install

The master branch of this repo is automatically deployed by puppet to /var/www/ood/apps/sys/ on the ondemand nodes.

If you want to deploy that in your user development environment to make modifications, follow these instructions. 

```sh
# create the development folder if you still not have one
mkdir -pv $HOME/fasrc/dev/
cd $HOME/fasrc/dev/

# clone the repository in a subfolder for your version of the app
git clone https://github.com/fasrc/fas-ondemand-rstudio.git

# Change the working directory to this new directory
cd fas-ondemand-rstudio
```
You can now make your preferred modifications and run your version of the app from the sandbox control panel under the
*dev* menu on the ondemand dashboard

## Contributing

If you intend deploy your modified version as system wide app, please commit your changes to a branch first, and open a PR.
