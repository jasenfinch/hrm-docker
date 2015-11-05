FROM ubuntu:latest

MAINTAINER "Jasen Finch" jsf9@aber.ac.uk

RUN apt-get update \
&& apt-get -y dist-upgrade 

# Install external dependencies
RUN apt-get install -y \
  libnetcdf-dev \
  libudunits2-dev \
  udunits-bin \
  default-jdk \
  libcurl4-openssl-dev \
  libssl-dev
  
# Install R
RUN apt-get install -y \
  r-base \
  r-base-dev 

# Install R packages
RUN Rscript -e \
  'install.packages(c( \
  "xml2" \
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
