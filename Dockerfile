FROM r-base:latest

MAINTAINER "Jasen Finch" jsf9@aber.ac.uk

RUN apt-get update \
&& apt-get -y dist-upgrade 

## Install external dependencies
RUN apt-get install -y \
  libnetcdf-dev \
  libudunits2-dev \
  udunits-bin \
  default-jdk \
  libcurl4-openssl-dev \
  libssl-dev \
  libxml2-dev \
  ghostscript
  
## Install R packages
RUN R -e \
  'install.packages(c( \
  "devtools" \
  ),repo="http://cran.rstudio.com/",quiet = T)'

## Install bioconductor packages
RUN R -e \
  'source("http://bioconductor.org/biocLite.R"); \
  biocLite("BiocInstaller")'

## Check java settings for R
RUN R CMD javareconf

## Install metabolomics packages from github
RUN R -e \
  'library(devtools); \
  install_github("jasenfinch/hrm",quiet = T); \
  hrm::hrmSetup()'  \
  
