FROM ubuntu:22.04

MAINTAINER "Jasen Finch" jsf9@aber.ac.uk

RUN apt-get update \
&& apt-get -y dist-upgrade 

## Install external dependencies
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y \
  software-properties-common \
  wget \
  libssl-dev \
  libgit2-dev \
  cargo \
  libxml2-dev \
  libx11-dev \
  libcurl4-openssl-dev \
  libfontconfig1-dev \
  libharfbuzz-dev \
  libfribidi-dev \
  libfreetype6-dev \
  libpng-dev \
  libtiff5-dev \
  libjpeg-dev
  
## Install R
RUN wget -qO- https://cloud.r-project.org/bin/linux/ubuntu/marutter_pubkey.asc | tee -a /etc/apt/trusted.gpg.d/cran_ubuntu_key.asc
RUN add-apt-repository "deb https://cloud.r-project.org/bin/linux/ubuntu $(lsb_release -cs)-cran40/"
RUN apt-get update

RUN DEBIAN_FRONTEND=noninteractive apt-get install -y r-base

## Add Renviron.site to set library path
RUN mkdir /R
RUN echo "R_LIBS=/R" >> /usr/lib/R/etc/Renviron.site

## Install renv
RUN Rscript -e 'install.packages("renv")'

## Install Bioconductor, devtools & update R packages
RUN Rscript -e \
'renv::install(c("BiocManager","devtools","tidyverse"))'

RUN chmod -R 777 /R

