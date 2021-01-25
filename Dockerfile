FROM rocker/verse:4.0.3

## adding stuff from  https://github.com/Bioconductor/bioconductor_docker/blob/master/Dockerfile

RUN rm -f /var/lib/dpkg/available && apt clean && dpkg --clear-avail

# This is to avoid the error
# 'debconf: unable to initialize frontend: Dialog'
ENV DEBIAN_FRONTEND noninteractive

# Update apt-get
RUN apt-get update \
	&& apt-get install -y --no-install-recommends apt-utils \
	&& apt-get install -y --no-install-recommends \
	## Basic deps
	gdb \
	libxml2-dev \
	python3-pip \
	libz-dev \
	liblzma-dev \
	libbz2-dev \
	libpng-dev \
	## sys deps from bioc_full
	pkg-config \
	fortran77-compiler \
	byacc \
	automake \
	curl \
	## This section installs libraries
	libpcre2-dev \
	libnetcdf-dev \
	libhdf5-serial-dev \
	libfftw3-dev \
	libopenbabel-dev \
	libopenmpi-dev \
	libxt-dev \
	libudunits2-dev \
	libgeos-dev \
	libproj-dev \
	libcairo2-dev \
	libtiff5-dev \
	libreadline-dev \
	libgsl0-dev \
	libgslcblas0 \
	libgtk2.0-dev \
	libgl1-mesa-dev \
	libglu1-mesa-dev \
	libgmp3-dev \
	libhdf5-dev \
	libncurses-dev \
	libbz2-dev \
	libxpm-dev \
	liblapack-dev \
	libv8-dev \
	libgtkmm-2.4-dev \
	libmpfr-dev \
	libmodule-build-perl \
	libapparmor-dev \
	libprotoc-dev \
	librdf0-dev \
	libmagick++-dev \
	libsasl2-dev \
	libpoppler-cpp-dev \
	libprotobuf-dev \
	libpq-dev \
	libperl-dev \
	## software - perl extentions and modules
	libarchive-extract-perl \
	libfile-copy-recursive-perl \
	libcgi-pm-perl \
	libdbi-perl \
	libdbd-mysql-perl \
	libxml-simple-perl \
	libmysqlclient-dev \
	default-libmysqlclient-dev \
	libgdal-dev \
	## new libs
	libglpk-dev \
	## Databases and other software
	sqlite \
	openmpi-bin \
	mpi-default-bin \
	openmpi-common \
	openmpi-doc \
	tcl8.6-dev \
	tk-dev \
	default-jdk \
	imagemagick \
	tabix \
	ggobi \
	graphviz \
	protobuf-compiler \
	jags \
	## Additional resources
	xfonts-100dpi \
	xfonts-75dpi \
	biber \
	&& apt-get clean \
	&& rm -rf /var/lib/apt/lists/*

## Python installations
RUN python3 -m pip install scikit-learn pandas pyyaml cwltool
#RUN apt-get update \
#	&& apt-get install -y software-properties-common \
#	&& add-apt-repository universe \
#	&& apt-get update \
#	&& apt-get -y --no-install-recommends install python2 python-dev \
#	&& curl https://bootstrap.pypa.io/get-pip.py --output get-pip.py \
#	&& python3 get-pip.py \
#	&& pip2 install wheel \
#	## Install sklearn and pandas on python
#	&& pip2 install sklearn \
#	pandas \
#	pyyaml \
#	cwltool \
#	&& apt-get clean \
#	&& rm -rf /var/lib/apt/lists/* \
#	&& rm -rf get-pip.py

## FIXME
## These two libraries don't install in the above section--WHY?
RUN apt-get update \
	&& apt-get -y --no-install-recommends install \
	libmariadb-dev-compat \
	libjpeg-dev \
	libjpeg-turbo8-dev \
	libjpeg8-dev \
	&& apt-get clean \
	&& rm -rf /var/lib/apt/lists/*

## add a couple of collections of latex style files
RUN tlmgr update --self \
	&& tlmgr install collection-latex \
	&& tlmgr install collection-latexrecommended \
	&& tlmgr install collection-latexextra

## Explicitly requested packages 
# 
# For example:
#
#  RUN install2.r corrplot learnr
#  RUN Rscript -e 'devtools::install_github("OI-Biostat/oi_biostat_data")' \
#        && Rscript -e 'devtools::install_github("rstudio-education/gradethis")' \
#        && Rscript -e 'devtools::install_github("kosukeimai/qss-package", build_vignettes=TRUE)' \
#        && Rscript -e 'devtools::install_github("rundel/learnrhash")' \
#        && Rscript -e 'devtools::install_github("davidkane9/PPBDS.data")'
#

## Requested packages for GOV 1005: Big Data
#
# Note that this container includes the dependencies for the following
# course-specific packages: 
# 	- https://github.com/PPBDS/primer.data
# 	- https://github.com/PPBDS/primer.tutorials
# 
# To install the packages:
# 	- remotes::install_github(c("PPBDS/primer.data", "PPBDS/primer.tutorials"))
#
# To view the dependencies:
# 	- tools::package_dependencies("primer.tutorials", db = installed.packages())
#
# Important note about "learnr" package: 
#	- The latest release is v0.10.1 (Feb 2020), but we need to include the bug fix
#	  for https://github.com/rstudio/learnr/issues/347 which is only available by
#	  installing from source. This is why we are installing the latest source
#	  release from github (latest master as of Jan 2021).
#

RUN install2.r -e fs curl corrplot \
	&& install2.r -e base64enc fivethirtyeight gapminder ggthemes grid gt gt infer lubridate nnet nycflights13 png readr readxl rlang rmarkdown rstanarm shiny skimr stringr testthat tidybayes tidymodels tidyverse usethis viridis \  
	&& Rscript -e 'remotes::install_github("rstudio/learnr", ref="6694842d8b9a74fbff92ef8a64a49adcc5a30199")' \
	&& Rscript -e 'remotes::install_github("PPBDS/primer.data")' \
	&& Rscript -e 'remotes::install_github("PPBDS/primer.tutorials")' 
