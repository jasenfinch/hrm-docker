FROM r-base:latest

MAINTAINER "Jasen Finch" jsf9@aber.ac.uk

RUN apt-get update \
&& apt-get -y dist-upgrade 

## Install external dependencies
RUN apt-get install -y \
  libnetcdf-dev \
  libudunits2-dev \
  udunits-bin \
  default-jdk \
  libssl-dev \
  libxml2-dev \
  pandoc \
  pandoc-citeproc \
  ghostscript
  
## Install R packages
RUN Rscript -e \
  'install.packages(c( \
  "remotes" \
  ),repo="http://cran.rstudio.com/",quiet = T)'

## Check java settings for R
RUN R CMD javareconf

## Install metabolomics packages from github
RUN Rscript -e \
  'remotes::install_github("jasenfinch/hrm",quiet = T)'

RUN Rscript -e \
  'hrm::hrmSetup()'
