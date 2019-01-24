FROM ubuntu:18.04

MAINTAINER "Jasen Finch" jsf9@aber.ac.uk

ARG GITHUB_PAT

RUN apt-get update \
&& apt-get -y dist-upgrade 

## Install external dependencies
RUN apt-get install -y \
  software-properties-common \
  libnetcdf-dev \
  libudunits2-dev \
  udunits-bin \
  default-jdk \
  pandoc \
  pandoc-citeproc \
  ghostscript \
  libopenbabel-dev \
  libgit2-dev

## Install R
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E298A3A825C0D65DFD57CBB651716619E084DAB9

RUN add-apt-repository 'deb https://cloud.r-project.org/bin/linux/ubuntu bionic-cran35/'

RUN apt-get update

RUN DEBIAN_FRONTEND=noninteractive apt-get install -y r-base

## Check java settings for R
RUN R CMD javareconf

## Install Bioconductor & update R packages
RUN Rscript -e \
  'install.packages("BiocManager"); \
  BiocManager::install(ask = FALSE)'
  
## Install metabolomics packages from github
RUN Rscript -e \
  'devtools::install_github("jasenfinch/hrm")'

RUN Rscript -e \
  'hrm::hrmSetup()'
