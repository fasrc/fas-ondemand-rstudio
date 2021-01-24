FROM harvardat/rstudio-master

RUN Rscript -e 'install.packages(c("sp","ncdf4","raster","fields"))'
