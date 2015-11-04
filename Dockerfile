FROM rocker/hadleyverse:latest

MAINTAINER "Jasen Finch" jsf9@aber.ac.uk

# Install external dependencies
RUN apt-get update \
&& apt-get -t unstable -y dist-upgrade \ 
&& apt-get install -y --no-install-recommends -t unstable \
  libnetcdf-dev \
  libudunits2-dev \
  udunits-bin \
  default-jdk \
&& apt-get clean \
&& rm -rf /var/lib/apt/lists/ \
&& rm -rf /tmp/downloaded_packages/ /tmp/*.rds

# Install bioconductor packages
RUN Rscript -e 'source("http://bioconductor.org/biocLite.R"); biocLite("BiocInstaller");biocLite(c("mzR","impute"))' 

  
# Install metabolomics packages from github
RUN Rscript -e 'library(devtools);install_github("wilsontom/FIEmspro");install_github("jasenfinch/OrbiFIEproc");install_github("jasenfinch/OrbiFIEmisc");install_github("jasenfinch/mzAnnotation")' 