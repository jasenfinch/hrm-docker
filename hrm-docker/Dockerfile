FROM ghcr.io/jasenfinch/ubuntu-r-xcms

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
  libcairo2-dev \
  libsodium-dev \
  mono-runtime \
  libeigen3-dev \
  default-jdk \
  git

## Install metabolomics packages from github
RUN Rscript -e 'renv::install("jasenfinch/hrm")'

RUN chmod -R 777 /R
