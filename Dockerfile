# Stage 1: Tidyverse base with development tools
FROM rocker/tidyverse:latest AS tidyverse_stage

# Stage 2: Final image with geospatial + tidyverse tools
FROM rocker/geospatial:latest


WORKDIR /rocker-build/

# Install apt-getable packages to start
RUN apt-get update && apt-get install -y --no-install-recommends apt-utils dialog

RUN apt-get install -y --no-install-recommends \
    libxt6 \
    libpoppler-cpp-dev \
    vim \
    libglpk40 \
    curl \
    gpg

# Install gh
RUN curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | gpg --dearmor -o /usr/share/keyrings/githubcli-archive-keyring.gpg

RUN echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | tee /etc/apt/sources.list.d/github-cli.list > /dev/null

RUN apt update && apt install -y gh

# Add curl, bzip2
RUN apt-get update -qq && apt-get -y --no-install-recommends install \
    bzip2 \
    curl

RUN apt-get update && apt-get install -y --no-install-recommends \
    pandoc \
    curl \
    gdebi-core \
    python3-pip \
    python3-dev \
    && rm -rf /var/lib/apt/lists/*

RUN Rscript -e "remove.packages('rlang')"

# Commonly used R packages (littler's install2.r is included in rocker/tidyverse)
RUN install2.r --error --deps FALSE \
    rlang \
    bookdown \
    emojifont \
    here \
    optparse \
    oro.nifti \
    qpdf \
    R.utils \
    rprojroot \
    googlesheets4 \
    servr \
    spelling \
    styler \
    reticulate \
    gh \
    tibble \
    config \
    quarto \
    chromote \
    rvest \
    DT \
    knitr \
    xfun \
    testthat \
    webshot2

RUN curl -LO https://quarto.org/download/latest/quarto-linux-$(dpkg --print-architecture).deb

RUN gdebi --non-interactive quarto-linux-$(dpkg --print-architecture).deb

# cow needs this dependency:
RUN Rscript -e "pak::pak('gitcreds@0.1.1')"

RUN install2.r --error --deps FALSE remotes

RUN installGithub.r \
  ottrproject/ottrpal \
  jhudsl/cow

# Set final workdir for commands
WORKDIR /home/rstudio

RUN echo CHROMOTE_CHROME=/usr/bin/chromium-browser >> .Renviron

# Geospatial packages for your project
RUN install2.r --error --deps TRUE stringr

RUN install2.r --error --deps TRUE rnaturalearthdata

RUN install2.r --error --deps TRUE naniar

RUN install2.r --error --deps FALSE \
    sf \
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
