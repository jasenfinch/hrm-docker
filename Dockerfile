FROM rocker/tidyverse:latest

MAINTAINER "Jasen Finch" jsf9@aber.ac.uk

ARG GITHUB_PAT

RUN apt-get update \
&& apt-get -y dist-upgrade 

## Install external dependencies
RUN apt-get install -y \
  libnetcdf-dev \
  libudunits2-dev \
  udunits-bin \
  default-jdk \
  pandoc \
  pandoc-citeproc \
  ghostscript

## Check java settings for R
RUN R CMD javareconf

## Install metabolomics packages from github
RUN Rscript -e \
  'devtools::install_github("jasenfinch/hrm@devel")'

RUN Rscript -e \
  'hrm::hrmSetup()'
