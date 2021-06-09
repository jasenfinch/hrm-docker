FROM ubuntu:20.04

MAINTAINER "Jasen Finch" jsf9@aber.ac.uk

RUN apt-get update \
&& apt-get -y dist-upgrade 

## Install external dependencies
RUN apt-get install -y \
  software-properties-common \
  libssl-dev \
  libgit2-dev \
  cargo \
  libxml2-dev \
  libx11-dev \
  libcurl4-openssl-dev

## Install R
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E298A3A825C0D65DFD57CBB651716619E084DAB9
RUN add-apt-repository 'deb https://cloud.r-project.org/bin/linux/ubuntu focal-cran40/'

RUN apt-get update

RUN DEBIAN_FRONTEND=noninteractive apt-get install -y r-base

## Add Renviron.site to set library path
RUN mkdir /R
RUN echo "R_LIBS=/R" >> /usr/lib/R/etc/Renviron.site


## Install Bioconductor, devtools & update R packages
RUN Rscript -e \
'install.packages(c("BiocManager","devtools","tidyverse")); \
  BiocManager::install(ask = FALSE)'

RUN chmod -R 777 /R

