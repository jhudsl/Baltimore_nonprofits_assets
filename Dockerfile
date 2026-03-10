# Edits from cansavvy to change to littler as well as pinning to a version
FROM rocker/tidyverse:4.4.2
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
    && rm -rf /var/lib/apt/lists/*

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
