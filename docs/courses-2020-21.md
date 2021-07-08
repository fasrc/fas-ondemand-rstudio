# Courses (2020-21)

This is intended as a record of custom RStudio applications for Fall 2020 and Spring 2021. All custom RStudio applications were based on [rocker/verse](https://hub.docker.com/r/rocker/verse) docker images (4.0.2, 4.0.3). For Fall 2020, [RStudio 1.3](https://blog.rstudio.com/2020/05/27/rstudio-1-3-release/) was used, and for Spring 2021 [RStudio 1.4](https://blog.rstudio.com/2021/01/19/announcing-rstudio-1-4/) was used. 

- [Courses (2020-21)](#courses-2020-21)
  - [Datafest](#datafest)
  - [DPI610](#dpi610)
  - [ESE6](#ese6)
  - [GOV50](#gov50)
  - [GOV51](#gov51)
  - [GOV1005](#gov1005)
  - [OEB275r](#oeb275r)
  - [SCRB50](#scrb50)
  - [SCRB155](#scrb155)


## Datafest

**Course:** Harvard DataFest 2021 (19-22 January 2021)

**Term:** Spring 2021

**Branch commit:** [37755dc](https://github.com/fasrc/fas-ondemand-rstudio/tree/37755dc3c8f3df484bb3ddf6388e8a96aed52634)

**Packages:**

```
RUN Rscript -e 'install.packages("dataverse")' \
    && Rscript -e 'install.packages("viridis")' \
    && Rscript -e 'install.packages("sf")' \
    && Rscript -e 'install.packages("remotes")' \
    && Rscript -e 'install.packages("leaflet")' \
    && Rscript -e 'install.packages("mapview")' \
    && Rscript -e 'install.packages("htmltools")' \
    && Rscript -e 'install.packages("htmlwidgets")' \
    && Rscript -e 'install.packages("tigris")' \
    && Rscript -e 'install.packages(c("Matrix","glmmTMB"))' \
    && Rscript -e 'install.packages("effects")' \
    && Rscript -e 'install.packages("DHARMa")' \
    && Rscript -e 'install.packages("rmarkdown")' \
    && Rscript -e 'install.packages("tidycensus")' \
    && Rscript -e 'install.packages("tidymodels")' \
    && Rscript -e 'install.packages("tidyverse")' \
    && Rscript -e 'install.packages("BiocManager")' \
    && Rscript -e 'install.packages("pheatmap")'
```

**Form:** memory:16 cpu:8

**Additional customizations?** No

## DPI610

**Course:** DPI 610: Data Science for Politics (cross-listed as GOV 1003)

**Term:** Spring 2021

**Branch commit:** [9a9156f](https://github.com/fasrc/fas-ondemand-rstudio/tree/9a9156feb2c0a565adc56eeb659da138de8d2ebc)

**Packages:**
```
RUN install2.r -e fs curl corrplot learnr \
	&& install2.r caTools pROC glmnet survey ggplot2 sf lwgeom data.table knit kableExtra stargazer caret foreign tidyverse
```

**Form:** memory:16 cpu:2

**Additional customizations?** No

## ESE6

**Course:** ESE6: Introduction to Environmental Science and Engineering

**Term:** Spring 2021

**Branch commit:** [7ca9b34](https://github.com/fasrc/fas-ondemand-rstudio/tree/7ca9b34dca8aab6378f9b0e41e01b517f08296e4)

**Packages:**

```
RUN Rscript -e 'install.packages(c("sp","ncdf4","raster","fields"))'
```

**Form:** memory:4 (allowed to choose 4-32 GB) cpu:1 (allowed to choose 1-16 cores)

**Additional customizations?** No

## GOV50

**Course:** GOV 50: Data ([site](https://www.davidkane.info/files/gov_50_fall_2020.html))

**Term:** Fall 2020

**Branch commit:** [195f4e1](https://github.com/fasrc/fas-ondemand-rstudio/tree/195f4e1d09008006bafdefcef2214cd16dc1bcf1)

**Packages:**

``` 
# Note: originally included https://github.com/davidkane9/PPBDS.data but then 
# excluded so students could install themselves.
#
RUN install2.r -e fs curl corrplot learnr tidymodels \
	&& install2.r -e tidyverse lubridate stringr shiny gapminder fueleconomy dslabs skimr viridis ggthemes fivethirtyeight nycflights13 gt learnr base64enc testthat rmarkdown \
	&& Rscript -e 'devtools::install_github("OI-Biostat/oi_biostat_data")' \
	&& Rscript -e 'devtools::install_github("rstudio-education/gradethis")' \
	&& Rscript -e 'devtools::install_github("kosukeimai/qss-package", build_vignettes=TRUE)' \
	&& Rscript -e 'devtools::install_github("rundel/learnrhash")'
```

**Form:** memory:16 (allowed to choose 4-32 GB) cpu:8

**Additional customization?** Yes

In `template/script.sh.erb`:

```
## some configuration requested by Prof Kane
if ! [ -f $HOME/.config/rstudio/rstudio-prefs.json ]
then
mkdir -p $HOME/.config/rstudio
cat > $HOME/.config/rstudio/rstudio-prefs.json <<EOF
{
    "panes": {
        "quadrants": [
            "Source",
            "Console",
            "TabSet1",
            "TabSet2"
        ],
        "tabSet1": [
            "Environment",
            "History",
            "Connections",
            "Build",
            "VCS",
            "Tutorial",
            "Presentation"
        ],
        "tabSet2": [
            "Files",
            "Plots",
            "Packages",
            "Help",
            "Viewer"
        ],
        "console_left_on_top": false,
        "console_right_on_top": true
    },
    "save_workspace": "never",
    "load_workspace": false,
    "posix_terminal_shell": "bash"
}
EOF
fi

## add startup command requested by Prof Kane
cat >${WORKDIR}/Rprofile.site <<END
options(repos = c(CRAN = 'https://packagemanager.rstudio.com/all/__linux__/focal/latest'), download.file.method = 'libcurl')
options(HTTPUserAgent = sprintf("R/%s R (%s)", getRversion(),
                 paste(getRversion(), R.version\$platform,
                       R.version\$arch, R.version\$os)))
options(pkgType = "binary")
END
```


## GOV51

**Course:** GOV 51: Data Analysis and Politics

**Term:** Fall 2020

**Branch commit:** [f44cc8a](https://github.com/fasrc/fas-ondemand-rstudio/tree/f44cc8ac798463662a457b566363edb897388caf)

**Packages:** 

```
# Note: devtools, tidyverse, tinytex installed by rocker/tidyverse
RUN install2.r -e fs curl corrplot learnr tidymodels \
	&& Rscript -e 'remotes::install_github("rstudio-education/gradethis")' \
	&& Rscript -e 'remotes::install_github("kosukeimai/qss-package", build_vignettes=TRUE)' \
	&& Rscript -e 'remotes::install_github("mattblackwell/qsslearnr")'

```

**Form:** memory:8 cpu:2

**Additional customization?** Yes, same as _gov50_

## GOV1005

**Course:** GOV 1005: Big Data

**Term:** Spring 2021

**Branch commit:** [0aefc9d](https://github.com/fasrc/fas-ondemand-rstudio/tree/0aefc9d24704cfaa1ff276016cb1b6c499b40ef0)

**Packages:**

```
# Note:
# Includes course-specific packages:
#     https://github.com/PPBDS/primer.data
#     https://github.com/PPBDS/primer.tutorials
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

```

**Form:** memory:16 (allowed to choose 4-32 GB) cpu:8

**Additional customization?** Yes, same as _gov50_. Also asked to simplify the bash prompt.

```
# Simplify bash prompt
if ! [ -f $HOME/.bash_prompt ]; then
    echo 'export PS1="$ "' > $HOME/.bash_prompt
fi
if ! grep -q "^. ~/.bash_prompt" $HOME/.bashrc; then
    echo ". ~/.bash_prompt" >> $HOME/.bashrc
fi
```

## OEB275r

**Course:** OEB 275R: Phylogenetics and Phylogeography in the Era of Genomics

**Term:** Spring 2021

**Branch commit:** [526df17](https://github.com/fasrc/fas-ondemand-rstudio/tree/526df17cfce07978e225da85bfc015d06482990c)

**Packages:** 

```
RUN install2.r -e fs curl corrplot tidyverse ape phangorn phytools geiger
```

**Form:** memory:16 cpu:8

**Additional customization?** Yes, same as _gov50_.

## SCRB50

**Course:**  CRB 50: Building a Human Body: From Gene to Cell to Organism

**Term:** Spring 2021

**Branch commit:** [ff251fc](https://github.com/fasrc/fas-ondemand-rstudio/tree/ff251fc3bae78a32394c89adb6050645210f6630)

**Packages:** 

```
RUN install2.r -e fs curl corrplot ggplot2 \
	&& install2.r -e data.table dplyr ggnewscale msigdbr pheatmap Seurat tibble VennDiagram \
	&& Rscript -e 'BiocManager::install(c("clusterProfiler", "DESeq2", "edgeR", "enrichplot"), ask=FALSE)' \
	&& Rscript -e 'remotes::install_github("YuLab-SMU/clusterProfiler.dplyr")' 
```

**Form:** memory:16 (allowed to choose 4-32 GB) cpu:8

**Additional customization?** No

## SCRB155

**Course:** SCRB 155: Epigenetics and Gene Regulation of Human Development and Disease

**Term:** Spring 2021

**Branch commit:** [9641abc](https://github.com/fasrc/fas-ondemand-rstudio/tree/9641abcbc3f50757d79c583a1e7848a2aa389c2c)

**Packages:**

```
RUN install2.r -e fs curl corrplot Seurat ggplot2 pheatmap data.table MASS umap \
	&& Rscript -e 'BiocManager::install(c("chromVAR", "motifmatchr", "SummarizedExperiment", "BSgenome.Hsapiens.UCSC.hg19", "BSgenome.Mmusculus.UCSC.mm10"), ask=FALSE)' \
	&& Rscript -e 'remotes::install_github("caleblareau/BuenColors")' \
	&& Rscript -e 'remotes::install_github("GreenleafLab/chromVARmotifs")' \
	&& Rscript -e 'remotes::install_github("GreenleafLab/ArchR", ref="master", repos = BiocManager::repositories())' 
```

**Form:** memory:16 (allowed to choose 4-32 GB) cpu:8

**Additional customization?** No