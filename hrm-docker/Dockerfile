FROM docker.pkg.github.com/jasenfinch/hrm-docker/ubuntu-r-xcms

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
  libfontconfig1-dev \
  libtiff5-dev \
  libcairo2-dev

## Install metabolomics packages from github
RUN Rscript -e \
  'devtools::install_github("jasenfinch/hrm")'

RUN chmod -R 777 /R
