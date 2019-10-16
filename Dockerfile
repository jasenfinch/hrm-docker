FROM jasenfinch/ubuntu-r-xcms:latest

MAINTAINER "Jasen Finch" jsf9@aber.ac.uk

ARG GITHUB_PAT

## Install external dependencies
RUN apt-get install -y \
  pandoc \
  pandoc-citeproc \
  ghostscript \
  libopenbabel-dev \
  mesa-common-dev \
  libglu1-mesa-dev \
  libfreetype6-dev \
  libhdf5-dev

## Install metabolomics packages from github
RUN Rscript -e \
  'devtools::install_github("jasenfinch/hrm")'

RUN Rscript -e \
  'hrm::hrmSetup()'
