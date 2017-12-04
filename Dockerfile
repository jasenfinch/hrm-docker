FROM ubuntu:latest

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
  
## Install R
RUN sh -c 'echo "deb http://cran.rstudio.com/bin/linux/ubuntu trusty/" >> /etc/apt/sources.list' \
&& gpg --keyserver keyserver.ubuntu.com --recv-key E084DAB9 \
&& gpg -a --export E084DAB9 | apt-key add - \
&& apt-get update \
&& apt-get install -y \
  r-base \
  r-base-dev \
&& apt-get clean

## Install R packages
RUN R -e \
  'install.packages(c( \
  "devtools" \
  ),repo="http://cran.rstudio.com/")'

## Install bioconductor packages
RUN R -e \
  'source("http://bioconductor.org/biocLite.R"); \
  biocLite("BiocInstaller"); \

## Check java settings for R
RUN R CMD javareconf

## Install metabolomics packages from github
RUN R -e \
  'library(devtools); \
  install_github("jasenfinch/hrm")
  hrm::hrmSetup()' 
