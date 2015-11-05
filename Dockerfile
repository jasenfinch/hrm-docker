FROM ubuntu:latest

MAINTAINER "Jasen Finch" jsf9@aber.ac.uk

RUN apt-get update \
&& apt-get -y dist-upgrade 

# Install R
RUN apt-get install -y \
  r-base \
  r-base-dev 

# Install external dependencies
RUN apt-get install -y \
  libnetcdf-dev \
  libudunits2-dev \
  udunits-bin \
  default-jdk 

# Install R packages
RUN Rscript -e \
  'install.packages(c( \
  "devtools" \
  ),repo="http://cran.rstudio.com/")'

# Install bioconductor packages
RUN Rscript -e \
  'source("http://bioconductor.org/biocLite.R"); \
  biocLite("BiocInstaller");biocLite(c("mzR","impute"))' 

# Install metabolomics packages from github
RUN Rscript -e \
  'library(devtools); \
  install_github("wilsontom/FIEmspro"); \
  install_github("jasenfinch/OrbiFIEproc"); \
  install_github("jasenfinch/OrbiFIEmisc"); \
  install_github("jasenfinch/mzAnnotation")' 
