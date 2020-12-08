# Dockerfile for R 4.0.3 - GOV 1005

To build the Dockerfile:

```sh
$ docker build -t harvardat/atg-rstudio-gov1005:4.0.3 .
```

To run the image:

```
$ docker run --rm -p 8787:8787 -e PASSWORD=yourpasswordhere harvardat/atg-rstudio-gov1005:4.0.3
```

Each image should be tagged with the git commit and pushed to docker hub:

```sh
$ export GIT_COMMIT_HASH=$(git log -1 --format=%h)
$ docker tag harvardat/atg-rstudio-gov1005:4.0.3 harvardat/atg-rstudio-gov1005:4.0.3-$GIT_COMMIT_HASH
$ docker tag harvardat/atg-rstudio-gov1005:4.0.3 harvardat/atg-rstudio-gov1005:latest
$ docker push harvardat/atg-rstudio-gov1005:4.0.3-$GIT_COMMIT_HASH
$ docker push harvardat/atg-rstudio-gov1005:4.0.3
$ docker push harvardat/atg-rstudio-gov1005:latest
```

The current image contains the following packages:

```
$ docker run --rm -ti harvardat/atg-rstudio-gov1005:4.0.3 R

R version 4.0.3 (2020-06-22) -- "Taking Off Again"
Copyright (C) 2020 The R Foundation for Statistical Computing
Platform: x86_64-pc-linux-gnu (64-bit)

R is free software and comes with ABSOLUTELY NO WARRANTY.
You are welcome to redistribute it under certain conditions.
Type 'license()' or 'licence()' for distribution details.

R is a collaborative project with many contributors.
Type 'contributors()' for more information and
'citation()' on how to cite R or R packages in publications.

Type 'demo()' for some demos, 'help()' for on-line help, or
'help.start()' for an HTML browser interface to help.
Type 'q()' to quit R.

> ip <- as.data.frame(installed.packages()[,c(1,3:4)])
> rownames(ip) <- NULL
> ip <- ip[is.na(ip$Priority),1:2,drop=FALSE]
> print(ip, row.names=FALSE)
> quit()
```
