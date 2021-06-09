FROM docker.pkg.github.com/jasenfinch/hrm-docker/ubuntu-r:latest

MAINTAINER "Jasen Finch" jsf9@aber.ac.uk

ARG GITHUB_PAT

## Install external dependencies
RUN apt-get install -y \
  libnetcdf-dev \
  libhdf5-dev

RUN Rscript -e \
  'BiocManager::install("xcms")'

RUN chmod -R 777 /R