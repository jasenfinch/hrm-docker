FROM jasenfinch/ubuntu-r:latest

MAINTAINER "Jasen Finch" jsf9@aber.ac.uk

ARG GITHUB_PAT

## Install external dependencies
RUN apt-get install -y \
  libnetcdf-dev \
  libudunits2-dev \
  udunits-bin \
  pandoc \
  pandoc-citeproc \
  ghostscript \
  libopenbabel-dev \
  mesa-common-dev \
  libglu1-mesa-dev

## Install metabolomics packages from github
RUN Rscript -e \
  'devtools::install_github("jasenfinch/hrm")'

RUN Rscript -e \
  'hrm::hrmSetup()'
