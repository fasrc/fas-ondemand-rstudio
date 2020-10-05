# Dockerfile for R 4.0.2 - GOV 51

To build the Dockerfile:

```sh
$ docker build -t harvardat/atg-rstudio-gov51:4.0.2 .
```

To run the image:

```
$ docker run --rm -p 8787:8787 -e PASSWORD=yourpasswordhere harvardat/atg-rstudio-gov51:4.0.2
```

Each image should be tagged with the git commit and pushed to docker hub:

```sh
$ export GIT_COMMIT_HASH=$(git log -1 --format=%h)
$ docker tag harvardat/atg-rstudio-gov51:4.0.2 harvardat/atg-rstudio-gov51:4.0.2-$GIT_COMMIT_HASH
$ docker tag harvardat/atg-rstudio-gov51:4.0.2 harvardat/atg-rstudio-gov51:latest
$ docker push harvardat/atg-rstudio-gov51:4.0.2-$GIT_COMMIT_HASH
$ docker push harvardat/atg-rstudio-gov51:4.0.2
$ docker push harvardat/atg-rstudio-gov51:latest
```

The current image contains the following packages:

```
$ docker run --rm -ti harvardat/atg-rstudio-gov51:4.0.2 R 

R version 4.0.2 (2020-06-22) -- "Taking Off Again"
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
      Package     Version
    animation         2.6
        arrow       1.0.0
      askpass         1.1
   assertthat       0.2.1
    backports      1.1.10
    base64enc       0.1-3
           BH    1.72.0-3
  BiocManager     1.30.10
          bit    1.1-15.2
        bit64     0.9-7.1
       bitops       1.0-6
         blob       1.2.1
     blogdown        0.20
     bookdown        0.20
         brew       1.0-6
        broom       0.7.1
        callr       3.4.4
   cellranger       1.1.0
    checkmate       2.0.0
          cli       2.0.2
        clipr       0.7.0
   colorspace       1.4-1
   commonmark         1.7
     corrplot        0.84
         covr       3.5.0
        cpp11       0.2.2
       crayon       1.3.4
  credentials       1.3.0
    crosstalk     1.1.0.1
         curl         4.3
    cyclocomp       1.1.0
   data.table      1.13.0
          DBI       1.1.0
       dbplyr       1.4.4
         desc       1.2.0
     devtools       2.3.1
        dials       0.0.9
   DiceDesign       1.8-1
       digest      0.6.25
       docopt       0.7.1
        dplyr       1.0.2
           DT        0.14
       dtplyr       1.0.1
     ellipsis       0.3.1
     evaluate        0.14
        fansi       0.4.1
       farver       2.0.3
      fastmap       1.0.1
      forcats       0.5.0
      foreach       1.5.0
           fs       1.5.0
          fst       0.9.2
        furrr       0.1.0
       future      1.19.1
     generics       0.0.2
         gert         0.3
      ggplot2       3.3.2
           gh       1.1.0
        git2r      0.27.1
      globals      0.13.0
         glue       1.4.2
        gower       0.2.2
        GPfit       1.0-8
    gradethis  0.1.0.9004
       gtable       0.3.0
      hardhat       0.1.4
        haven       2.3.1
        highr         0.8
          hms       0.5.3
    htmltools  0.5.0.9001
  htmlwidgets       1.5.2
       httpuv       1.5.4
         httr       1.4.2
       igraph       1.2.5
        infer       0.5.3
          ini       0.3.1
        ipred       0.9-9
      isoband       0.2.2
    iterators      1.0.12
     jsonlite       1.7.1
        knitr        1.30
     labeling         0.3
       Lahman       8.0-0
        later     1.1.0.1
         lava       1.6.8
     lazyeval       0.2.2
       learnr 0.10.1.9006
          lhs       1.1.0
    lifecycle       0.2.0
        lintr       2.0.1
      listenv       0.8.0
      littler      0.3.11
    lubridate       1.7.9
       magick       2.4.0
     magrittr         1.5
         maps       3.3.0
     markdown         1.1
      memoise       1.1.0
         mime         0.9
       miniUI     0.1.1.1
    modeldata       0.0.2
       modelr       0.1.8
      munsell       0.5.0
          NLP       0.2-0
     numDeriv  2016.8-1.1
 nycflights13       1.0.1
      openssl       1.4.3
      packrat       0.5.0
      parsnip       0.1.3
       pillar       1.4.6
     pkgbuild       1.1.0
    pkgconfig       2.0.3
      pkgload       1.1.0
        plogr       0.2.0
         plyr       1.8.6
       praise       1.0.0
  prettyunits       1.1.1
         pROC      1.16.2
     processx       3.4.4
      prodlim  2019.11.13
     progress       1.2.2
     promises       1.1.1
           ps       1.3.4
        purrr       0.3.4
          qss  0.1.0.9000
    qsslearnr  0.1.0.9003
           R6       2.4.1
     rappdirs       0.3.1
    rcmdcheck       1.3.3
 RColorBrewer       1.1-2
         Rcpp       1.0.5
        RCurl    1.98-1.2
        readr       1.3.1
       readxl       1.3.1
      recipes      0.1.13
      redland   1.0.17-11
      rematch       1.0.1
     rematch2       2.1.2
      remotes       2.2.0
         renv      0.12.0
       reprex       0.3.0
          rex       1.2.0
        rJava      0.9-13
        rlang       0.4.7
     RMariaDB       1.0.9
    rmarkdown         2.4
    rmdshower       2.1.1
     roxygen2       7.1.1
    RPostgres       1.2.0
    rprojroot       1.3-2
      rsample       0.0.8
    rsconnect      0.8.16
      RSQLite       2.2.0
   rstudioapi        0.11
      rticles        0.14
    rversions       2.0.2
        rvest       0.3.6
       scales       1.1.1
      selectr       0.4-2
        servr        0.17
  sessioninfo       1.1.1
        shiny       1.5.0
         slam      0.1-47
       slider       0.1.5
    SnowballC       0.7.0
  sourcetools       0.1.7
      SQUAREM      2020.4
      stringi       1.5.3
      stringr       1.4.0
        swirl       2.4.5
          sys         3.4
       testit        0.11
     testthat       2.3.2
       tibble       3.0.3
   tidymodels       0.1.1
        tidyr       1.1.2
   tidyselect       1.1.0
    tidyverse       1.3.0
     timeDate    3043.102
      tinytex        0.26
           tm       0.7-7
        tufte         0.6
         tune       0.1.1
      usethis       1.6.1
         utf8       1.1.4
        vctrs       0.3.4
  viridisLite       0.3.0
        vroom       1.2.1
         warp       0.1.0
      webshot       0.5.2
      whisker         0.4
       whoami       1.3.0
        withr       2.3.0
    wordcloud         2.6
    workflows       0.2.0
     xaringan        0.16
         xfun        0.18
         xml2       1.3.2
 xmlparsedata       1.0.4
        xopen       1.0.0
       xtable       1.8-4
         yaml       2.2.1
    yardstick       0.0.7
> quit()
```
