# Dockerfile for R 4.0.3 - SCRB 155

This is for [SCRB 155: Epigenetics and Gene Regulation of Human Development and Disease](https://canvas.harvard.edu/courses/81128).

## Build

To build the Dockerfile:

```sh
$ docker build -t harvardat/rstudio-scrb155:4.0.3 .
```

To run the image:

```
$ docker run --rm -p 8787:8787 -e PASSWORD=yourpasswordhere harvardat/rstudio-scrb155:4.0.3
```

Each image should be tagged with the git commit and pushed to docker hub:

```sh
$ export GIT_COMMIT_HASH=$(git log -1 --format=%h)
$ docker tag harvardat/rstudio-scrb155:4.0.3 harvardat/rstudio-scrb155:4.0.3-$GIT_COMMIT_HASH
$ docker tag harvardat/rstudio-scrb155:4.0.3 harvardat/rstudio-scrb155:latest
$ docker push harvardat/rstudio-scrb155:4.0.3-$GIT_COMMIT_HASH
$ docker push harvardat/rstudio-scrb155:4.0.3
$ docker push harvardat/rstudio-scrb155:latest
```

## Installed Packages

The current image contains the following packages:

```
$ docker run --rm -ti harvardat/rstudio-scrb155:4.0.3 R

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
                        abind      1.4-5
                     annotate     1.68.0
                AnnotationDbi     1.52.0
                        ArchR      1.0.1
                        arrow      3.0.0
                      askpass        1.1
                   assertthat      0.2.1
                    backports      1.2.1
                    base64enc      0.1-3
                           BH   1.75.0-0
                      Biobase     2.50.0
                 BiocGenerics     0.36.0
                  BiocManager    1.30.10
                 BiocParallel     1.24.1
                  BiocVersion     3.12.0
                   Biostrings     2.58.0
                          bit      4.0.4
                        bit64      4.0.5
                       bitops      1.0-6
                         blob      1.2.1
                     blogdown        1.1
                     bookdown       0.21
                         brew      1.0-6
                         brio      1.1.1
                        broom      0.7.4
                     BSgenome     1.58.0
  BSgenome.Hsapiens.UCSC.hg19      1.4.3
 BSgenome.Mmusculus.UCSC.mm10      1.4.0
                        bslib      0.2.4
                   BuenColors      0.5.6
                       cachem      1.0.4
                        Cairo   1.5-12.2
                        callr      3.5.1
                      caTools     1.18.1
                   cellranger      1.1.0
                     chromVAR     1.12.0
                     circlize     0.4.12
                          cli      2.3.0
                        clipr      0.7.1
                         clue     0.3-58
                         CNEr     1.26.0
                   colorspace      2.0-0
                   commonmark        1.7
               ComplexHeatmap      2.6.2
                     corrplot       0.84
                         covr      3.5.1
                      cowplot      1.1.1
                        cpp11      0.2.6
                       crayon      1.4.1
                  credentials      1.3.0
                    crosstalk      1.1.1
                         curl        4.3
                   data.table     1.13.6
                          DBI      1.1.1
                       dbplyr      2.1.0
                 DelayedArray     0.16.2
                       deldir     0.2-10
                         desc      1.2.0
                     devtools      2.3.2
                      diffobj      0.3.3
                       digest     0.6.27
         DirichletMultinomial     1.32.0
                       docopt      0.7.1
                        dplyr      1.0.4
                        dqrng      0.2.1
                           DT       0.17
                       dtplyr      1.0.1
                     ellipsis      0.3.1
                     evaluate       0.14
                        fansi      0.4.2
                       farver      2.0.3
                      fastmap      1.1.0
                 fitdistrplus      1.1-3
                          FNN      1.1.3
                      forcats      0.5.1
                      formatR        1.7
                           fs      1.5.0
                          fst      0.9.4
                futile.logger      1.4.3
               futile.options      1.0.1
                       future     1.21.0
                 future.apply      1.7.0
                     generics      0.1.0
                 GenomeInfoDb     1.26.2
             GenomeInfoDbData      1.2.4
            GenomicAlignments     1.26.0
                GenomicRanges     1.42.0
                         gert      1.2.0
                   GetoptLong      1.0.5
                      ggplot2      3.3.3
                      ggrepel      0.9.1
                     ggridges      0.5.3
                           gh      1.2.0
                     gitcreds      0.1.1
                GlobalOptions      0.1.2
                      globals     0.14.0
                         glue      1.4.2
                        GO.db     3.12.1
                      goftest      1.2-2
                       gplots      3.1.1
                    gridExtra        2.3
                       gtable      0.3.0
                       gtools      3.8.2
                        haven      2.3.1
                        highr        0.8
                          hms      1.0.0
                    htmltools    0.5.1.1
                  htmlwidgets      1.5.3
                       httpuv      1.5.5
                         httr      1.4.2
                          ica      1.0-2
                       igraph      1.2.6
                          ini      0.3.1
                      IRanges     2.24.1
                        irlba      2.3.3
                      isoband      0.2.3
                    jquerylib      0.1.3
                     jsonlite      1.7.2
                     KEGGREST     1.30.1
                        knitr       1.31
                     labeling      0.4.2
                       Lahman      8.0-1
                     lambda.r      1.2.4
                        later    1.1.0.1
                     lazyeval      0.2.2
                       leiden      0.3.7
                    lifecycle      1.0.0
                      listenv      0.8.0
                      littler     0.3.12
                       lmtest     0.9-38
                    lubridate    1.7.9.2
                     magrittr      2.0.1
                     markdown        1.1
               MatrixGenerics      1.2.1
                  matrixStats     0.58.0
                      memoise      2.0.0
                         mime       0.10
                       miniUI    0.1.1.1
                       modelr      0.1.8
                  motifmatchr     1.12.0
                      munsell      0.5.0
                        nabor      0.5.0
                 nycflights13      1.0.1
                      openssl      1.4.3
                      packrat      0.5.0
                   parallelly     1.23.0
                    patchwork      1.1.1
                      pbapply      1.4-3
                     pheatmap     1.0.12
                       pillar      1.4.7
                     pkgbuild      1.2.0
                    pkgconfig      2.0.3
                      pkgload      1.1.0
                        plogr      0.2.0
                       plotly      4.9.3
                         plyr      1.8.6
                          png      0.1-7
                     polyclip     1.10-0
                     poweRlaw     0.70.6
                       pracma      2.3.3
                       praise      1.0.0
                  prettyunits      1.1.1
                     processx      3.4.5
                     progress      1.2.2
                     promises    1.2.0.1
                           ps      1.5.0
                        purrr      0.3.4
                  R.methodsS3      1.8.1
                         R.oo     1.24.0
                      R.utils     2.10.1
                           R6      2.5.0
                         RANN      2.6.1
                     rappdirs      0.3.3
                    rcmdcheck      1.3.3
                 RColorBrewer      1.1-2
                         Rcpp      1.0.6
                    RcppAnnoy     0.0.18
                RcppArmadillo 0.10.2.1.0
                    RcppEigen  0.3.3.9.1
                 RcppProgress      0.4.2
                        RCurl   1.98-1.2
                        readr      1.4.0
                       readxl      1.3.1
                      redland  1.0.17-14
                      rematch      1.0.1
                     rematch2      2.1.2
                      remotes      2.2.0
                       reprex      1.0.0
                     reshape2      1.4.4
                   reticulate       1.18
                          rex      1.2.0
                        rhdf5     2.34.0
                 rhdf5filters      1.2.0
                     Rhdf5lib     1.12.1
                      Rhtslib     1.22.0
                        rJava     0.9-13
                        rjson     0.2.20
                        rlang     0.4.10
                     RMariaDB      1.1.0
                    rmarkdown        2.6
                    rmdshower      2.1.1
                         ROCR     1.0-11
                     roxygen2      7.1.1
                    RPostgres      1.3.1
                    rprojroot      2.0.2
                    Rsamtools      2.6.0
                    rsconnect     0.8.16
                     RSpectra     0.16-0
                      RSQLite      2.2.3
                   rstudioapi       0.13
                      rticles       0.18
                  rtracklayer     1.50.0
                        Rtsne       0.15
                    rversions      2.0.2
                        rvest      0.3.6
                    S4Vectors     0.28.1
                         sass      0.3.1
                       scales      1.1.1
                  scattermore        0.7
                  sctransform      0.3.2
                      selectr      0.4-2
                      seqLogo     1.56.0
                        servr       0.21
                  sessioninfo      1.1.1
                       Seurat      4.0.0
                 SeuratObject      4.0.0
                        shape      1.4.5
                        shiny      1.6.0
                        sitmo      2.0.1
                         snow      0.4-3
                  sourcetools      0.1.7
                     spatstat     1.64-1
                spatstat.data      2.0-0
               spatstat.utils      2.0-0
                      stringi      1.5.3
                      stringr      1.4.0
         SummarizedExperiment     1.20.0
                          sys        3.4
                       tensor        1.5
                       testit       0.12
                     testthat      3.0.2
                    TFBSTools     1.28.0
                    TFMPvalue      0.0.8
                       tibble      3.0.6
                        tidyr      1.1.2
                   tidyselect      1.1.0
                    tidyverse      1.3.0
                      tinytex       0.29
                        tufte        0.9
                         umap    0.2.7.0
                      usethis      2.0.1
                         utf8      1.1.4
                         uwot     0.1.10
                        vctrs      0.3.6
                  viridisLite      0.3.0
                        vroom      1.4.0
                        waldo      0.2.4
                      webshot      0.5.2
                      whisker        0.4
                       whoami      1.3.0
                        withr      2.4.1
                     xaringan       0.19
                         xfun       0.21
                          XML   3.99-0.5
                         xml2      1.3.2
                        xopen      1.0.0
                       xtable      1.8-4
                      XVector     0.30.0
                         yaml      2.2.1
                          zip      2.1.1
                     zlibbioc     1.36.0
                          zoo      1.8-8
> quit()
```
