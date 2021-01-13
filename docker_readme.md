# Dockerfile for R 4.0.3 - DPI 610

Note: _DPI 610: Data Science for Politics_ is cross-listed from HKS to FAS as _GOV 1003_. While the names can be used interchangeably when referring to the course, we are going to use _DPI 610_ when labeling this application and its components.

## Build

To build the Dockerfile:

```sh
$ docker build -t harvardat/rstudio-dpi610:4.0.3 .
```

To run the image:

```
$ docker run --rm -p 8787:8787 -e PASSWORD=yourpasswordhere harvardat/rstudio-dpi610:4.0.3
```

Each image should be tagged with the git commit and pushed to docker hub:

```sh
$ export GIT_COMMIT_HASH=$(git log -1 --format=%h)
$ docker tag harvardat/rstudio-dpi610:4.0.3 harvardat/rstudio-dpi610:4.0.3-$GIT_COMMIT_HASH
$ docker tag harvardat/rstudio-dpi610:4.0.3 harvardat/rstudio-dpi610:latest
$ docker push harvardat/rstudio-dpi610:4.0.3-$GIT_COMMIT_HASH
$ docker push harvardat/rstudio-dpi610:4.0.3
$ docker push harvardat/rstudio-dpi610:latest
```

## Installed Packages

The current image contains the following packages:

```
$ docker run --rm -ti harvardat/rstudio-dpi610:4.0.3 R

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
      Package    Version
        arrow      2.0.0
      askpass        1.1
   assertthat      0.2.1
    backports      1.2.0
    base64enc      0.1-3
           BH   1.72.0-3
  BiocManager    1.30.10
          bit      4.0.4
        bit64      4.0.5
       bitops      1.0-6
         blob      1.2.1
     blogdown       0.21
     bookdown       0.21
         brew      1.0-6
         brio      1.1.0
        broom      0.7.2
        callr      3.5.1
        caret     6.0-86
      caTools     1.18.1
   cellranger      1.1.0
    checkmate      2.0.0
     classInt      0.4-3
          cli      2.2.0
        clipr      0.7.1
   colorspace      2.0-0
   commonmark        1.7
     corrplot       0.84
         covr      3.5.1
        cpp11      0.2.4
       crayon      1.3.4
  credentials      1.3.0
    crosstalk    1.1.0.1
         curl        4.3
   data.table     1.13.6
          DBI      1.1.0
       dbplyr      2.0.0
         desc      1.2.0
     devtools      2.3.2
      diffobj      0.3.2
       digest     0.6.27
       docopt      0.7.1
        dplyr      1.0.2
           DT       0.16
       dtplyr      1.0.1
        e1071      1.7-4
     ellipsis      0.3.1
     evaluate       0.14
        fansi      0.4.1
       farver      2.0.3
      fastmap      1.0.1
      forcats      0.5.0
      foreach      1.5.1
           fs      1.5.0
          fst      0.9.4
     generics      0.1.0
         gert      1.0.2
      ggplot2      3.3.3
           gh      1.2.0
        git2r     0.27.1
     gitcreds      0.1.1
       glmnet        4.1
         glue      1.4.2
        gower      0.2.2
       gtable      0.3.0
        haven      2.3.1
        highr        0.8
          hms      0.5.3
    htmltools      0.5.0
  htmlwidgets      1.5.2
       httpuv      1.5.4
         httr      1.4.2
          ini      0.3.1
        ipred      0.9-9
      isoband      0.2.3
    iterators     1.0.13
     jsonlite      1.7.1
   kableExtra      1.3.1
        knitr       1.30
     labeling      0.4.2
       Lahman      8.0-0
        later    1.1.0.1
         lava    1.6.8.1
     lazyeval      0.2.2
       learnr     0.10.1
    lifecycle      0.2.0
      littler     0.3.12
    lubridate    1.7.9.2
       lwgeom      0.2-5
     magrittr      2.0.1
     markdown        1.1
      memoise      1.1.0
         mime        0.9
       miniUI    0.1.1.1
        minqa      1.2.4
      mitools        2.4
 ModelMetrics    1.2.2.2
       modelr      0.1.8
      munsell      0.5.0
     numDeriv 2016.8-1.1
 nycflights13      1.0.1
      openssl      1.4.3
      packrat      0.5.0
       pillar      1.4.7
     pkgbuild      1.1.0
    pkgconfig      2.0.3
      pkgload      1.1.0
        plogr      0.2.0
         plyr      1.8.6
       praise      1.0.0
  prettyunits      1.1.1
         pROC     1.16.2
     processx      3.4.5
      prodlim 2019.11.13
     progress      1.2.2
     promises      1.1.1
           ps      1.5.0
        purrr      0.3.4
           R6      2.5.0
     rappdirs      0.3.1
    rcmdcheck      1.3.3
 RColorBrewer      1.1-2
         Rcpp      1.0.5
        readr      1.4.0
       readxl      1.3.1
      recipes     0.1.15
      redland  1.0.17-14
      rematch      1.0.1
     rematch2      2.1.2
      remotes      2.2.0
         renv     0.12.5
       reprex      0.3.0
     reshape2      1.4.4
          rex      1.2.0
        rJava     0.9-13
        rlang      0.4.9
     RMariaDB     1.0.10
    rmarkdown        2.5
    rmdshower      2.1.1
     roxygen2      7.1.1
    RPostgres      1.2.1
    rprojroot      2.0.2
    rsconnect     0.8.16
      RSQLite      2.2.1
   rstudioapi       0.13
      rticles       0.17
    rversions      2.0.2
        rvest      0.3.6
       scales      1.1.1
      selectr      0.4-2
        servr       0.20
  sessioninfo      1.1.1
           sf      0.9-7
        shape      1.4.5
        shiny      1.5.0
  sourcetools      0.1.7
      SQUAREM     2020.5
    stargazer      5.2.2
      stringi      1.5.3
      stringr      1.4.0
       survey        4.0
          sys        3.4
       testit       0.12
     testthat      3.0.0
       tibble      3.0.4
        tidyr      1.1.2
   tidyselect      1.1.0
    tidyverse      1.3.0
     timeDate   3043.102
      tinytex       0.27
        tufte        0.9
        units      0.6-7
      usethis      1.6.3
         utf8      1.1.4
        vctrs      0.3.5
  viridisLite      0.3.0
        vroom      1.3.2
        waldo      0.2.3
      webshot      0.5.2
      whisker        0.4
       whoami      1.3.0
        withr      2.3.0
     xaringan       0.18
         xfun       0.19
         xml2      1.3.2
        xopen      1.0.0
       xtable      1.8-4
         yaml      2.2.1
          zip      2.1.1
> quit()
```