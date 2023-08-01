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

RUN Rscript -e 'remotes::install_github("jasenfinch/renv@auth")'

## Install metabolomics packages from github
RUN Rscript -e 'renv::install(c( \
  "jasenfinch/BiocParallel.FutureParam", \
  "wilsontom/msconverteR", \
  "aberHRML/binneR", \
  "jasenfinch/profilePro", \
  "jasenfinch/metabolyseR", \
  "aberHRML/mzAnnotation", \
  "aberHRML/assignments", \
  "aberHRML/classyfireR", \
  "jasenfinch/cheminf", \
  "jasenfinch/construction", \
  "jasenfinch/missForest", \
  "davidsjoberg/ggsankey", \
  "jasenfinch/grover", \
  "jasenfinch/riches", \
  "jasenfinch/metaboMisc", \
  "jasenfinch/projecttemplates", \
  "jasdumas/gramr", \
  "benmarwick/wordcountaddin", \
  "jasenfinch/jfmisc", \
  "jasenfinch/metaboWorkflows", \
  "jasenfinch/hrm"))'

RUN chmod -R 777 /R
