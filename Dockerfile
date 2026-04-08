# Edits from cansavvy to change to littler as well as pinning to a version
FROM jhudsl/base_ottr:main-r4.4.0
LABEL maintainer="cwright2@fredhutch.org"

# Install R packages via littler (install2.r is included in rocker/tidyverse)
RUN install2.r --error --deps TRUE stringr

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

RUN install2.r --error --deps TRUE sf

RUN install2.r --error --deps TRUE naniar

RUN install2.r --error --deps TRUE \
    stars \
    areal \
    leafem \
    leafgl \
    leaflegend \
    leaflet \
    leafsync \
    maptiles \
    s2 \
    tmaptools \
    units \
    tmap \
    raster \
    lwgeom \
    leafpop \
    satellite \
    mapview
    
    HEALTHCHECK --interval=30s --timeout=10s --retries=3 CMD curl -f http://localhost/health || exit 1

