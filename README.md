# Baltimore_nonprofits_assets

Analysis to accompany article by Tyler Derreth et al. "Serving a Segregated City: An Analysis of Nonprofit Locations in Baltimore "

There are a few Rmd files/scripts.

1) 01_data_import_pre_geo.Rmd imports all necessary data except the shape file.

This includes the following data downloaded September 4th 2025:

- data/eo_md_5_25.csv
  - Original link:  https://www.irs.gov/downloads/irs-soi --> then search for eo_md.csv
  - Direct link: https://www.irs.gov/pub/irs-soi/eo_md.csv
  - The data was posted on the IRS website August 11, 2025 and downloaded by us on September 4th, 2025

- data//data-download-epostcard.txt
  - Original link: https://www.irs.gov/charities-non-profits/tax-exempt-organization-search-bulk-data-downloads --> scrolled down to Form 990-N (e-Postcard) section
  - Direct link: https://apps.irs.gov/pub/epostcard/data-download-epostcard.zip 
  - The data was posted on the IRS website: March 10, 2025 and downloaded by us on September 4th, 2025
 
- revocations in data/data-download-revocation.txt
  - Original link: https://www.irs.gov/charities-non-profits/tax-exempt-organization-search-bulk-data-downloads --> click on automatic revocation or exemption list link
  - Direct link (this dataset will change overtime): https://apps.irs.gov/pub/epostcard/data-download-revocation.zip
  - The data was posted on the IRS website: March 10, 2025 and downloaded by us on downloaded September 4th, 2025


Note that this data is frequently getting re-posted/updated. The data that was used for the analysis is available in this repository at the path indicated.

2) 02_geo_coding.R 

This file has code that performs the geocoding to get the latitude and longitude based on the address for the nonprofit orgs.

3) 03_Shape_filtering_after_geo_coding.Rmd

This file has code that filters the geocoded IRS data for only those found in Baltimore. This file also filters out orgs that we don't want to keep in the analysis.

4) 04_prepare_neighborhood_data.Rmd

This file imports the nonprofit asset information and the neighborhood information (downloaded September 4th, 2025).

Asset information comes from the BMF data: data/MD_BMF_V1.1.csv

Original Link: https://nccs.urban.org/nccs/datasets/bmf/ --> clicked on BMF by state --> searched for MD
Direct Link:  https://nccsdata.s3.amazonaws.com/harmonized/bmf/unified/MD_BMF_V1.1.csv  

Neighborhood information including the shape file and stats about neighborhood compositions comes from:

Original link: https://data.baltimorecity.gov/datasets/baltimore::neighborhood-statistical-area-nsa-boundaries/about
Click on "Download" --> CSV for neighborhood stats 
                    --> Shapefile for neighborhood shapefile

Data was last updated before we downloaded on April 11, 2025.

5) index.Rmd

This file takes the data and performs stats analysis and creates plots.


Please see this link for a rendered report of our analysis and the steps that we took in analyzing the data: https://jhudatascience.org/Baltimore_nonprofits_assets/. 
