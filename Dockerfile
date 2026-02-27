FROM rocker/tidyverse:latest
LABEL maintainer="cwright2@fredhutch.org"

WORKDIR /rocker-build/

# Other packages
RUN apt-get update && apt-get install -y \
    libgdal-dev \
    libgeos-dev \
    libproj-dev \
    && rm -rf /var/lib/apt/lists/*

# Install naniar from GitHub
RUN Rscript -e "devtools::install_github('npapier/naniar')"


RUN Rscript -e  "options(warn = 2);install.packages( \
    c('RNetCDF',\
     'ncmeta',\
     'sf',\
     'stars',\
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
