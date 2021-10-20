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
  libfreetype6-dev \
  libfontconfig1-dev \
  libtiff5-dev \
  libcairo2-dev \
  libsodium-dev \
  mono-runtime

## Install metabolomics packages from github
#RUN Rscript -e 'renv::install(c("bioc::KEGGREST","jasenfinch/composition"))'
RUN Rscript -e 'renv::install(c("bioc::KEGGREST","bioc::rawrr","bioc::FELLA"))'
RUN Rscript -e 'renv::install("jasenfinch/hrm")'

RUN chmod -R 777 /R
