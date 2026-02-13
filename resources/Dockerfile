FROM jhudsl/base_ottr:main
LABEL maintainer="cwright2@fredhutch.org"

#################### EXAMPLES OF INSTALLING PACKAGES ###########################

# Install a package from CRAN
 RUN Rscript -e  "options(warn = 2);install.packages( \
   c(raster, sf), \
    repos = 'https://cloud.r-project.org/')"

