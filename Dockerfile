FROM rocker/verse:4.1.1

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
	libjpeg-dev \
	libjpeg-turbo8-dev \
	libjpeg8-dev \
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

RUN install2.r -e BiocManager fs curl corrplot data.table pheatmap learnr tidyverse tidymodels raster remotes rgdal Hmisc matrixcalc R.matlab rstan mcmc pdxTrees infer moderndive Seurat ggplot2 MASS umap Signac swirl \
	&& Rscript -e 'BiocManager::install(c("chromVAR", "motifmatchr", "SummarizedExperiment", "BSgenome.Hsapiens.UCSC.hg19", "BSgenome.Mmusculus.UCSC.mm10"), ask=FALSE)' \
	&& Rscript -e 'remotes::install_github("caleblareau/BuenColors")' \
	&& Rscript -e 'remotes::install_github("GreenleafLab/chromVARmotifs")' \
	&& Rscript -e 'remotes::install_github("GreenleafLab/ArchR", ref="master", repos = BiocManager::repositories())' 
