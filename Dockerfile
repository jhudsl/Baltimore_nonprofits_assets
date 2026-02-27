FROM rocker/tidyverse:latest
LABEL maintainer="cwright2@fredhutch.org"

WORKDIR /rocker-build/

# System dependencies for R packages
RUN apt-get update && apt-get install -y \
    cmake \
    xz-utils \
    libgmp-dev \
    libudunits2-dev \
    libcurl4-openssl-dev \
    libssl-dev \
    libxml2-dev \
    libfontconfig1-dev \
    libfreetype6-dev \
    libharfbuzz-dev \
    libfribidi-dev \
    libpng-dev \
    libjpeg-dev \
    libtiff-dev \
    libcairo2-dev \
    libgit2-dev \

RUN Rscript -e  "options(warn = 2);install.packages('stringr')"

RUN Rscript -e  "options(warn = 2);install.packages('sf')"

RUN Rscript -e  "options(warn = 2);install.packages('naniar')"


RUN Rscript -e  "options(warn = 2);install.packages( \
    c('stars',\
     'areal',\
     'leafem',\
     'leafgl',\
     'leaflegend',\
     'leaflet',\
     'leafsync',\
     'maptiles', \
     's2',\
     'tmaptools',\
     'units',\
     'tmap', \
     'raster',\
     'lwgeom', \
     'leafpop',\
     'satellite',\
      'mapview), \
    dependencies=TRUE, repos = 'https://cloud.r-project.org/')"
