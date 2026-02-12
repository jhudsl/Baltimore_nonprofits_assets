# Baltimore_nonprofits_assets

Analysis to accompany article by Tyler Derreth et al. "Serving a Segregated City: An Analysis of Nonprofit Locations in Baltimore "

There are a few Rmd files:.\

01-prepare_neighborhood_data.Rmd

- Takes MD_BMV_V1.1.csv and Neighborhood_Statistical_Area_(NSA)_Boundaries.csv files (file helps us skip lots of steps we were originally doing ourselves
- It gets lat and long for the shape file and filters for the region of Baltimore creating **data/processed/neighborhood_shape_data.rds** and combines the two files together to make the **data/processed/org_data.rds** file

This file imports the nonprofit asset information and the neighborhood information .

Asset information comes from the BMF data: data/MD_BMF_V1.1.csv - this is limited in that churches are not required to file.

Original Link: https://nccs.urban.org/nccs/datasets/bmf/ --> clicked on BMF by state --> searched for MD, looks like these got posted March 4th 2024
Direct Link:  https://nccsdata.s3.amazonaws.com/harmonized/bmf/unified/MD_BMF_V1.1.csv  (downloaded September 4th, 2025)

Neighborhood information including the shape file and stats about neighborhood compositions comes from:

Original link: https://data.baltimorecity.gov/datasets/baltimore::neighborhood-statistical-area-nsa-boundaries/about
Click on "Download" --> CSV for neighborhood stats 
                    --> Shapefile for neighborhood shapefile

Data was last updated before we downloaded on April 11, 2025.(Data was downloaded September 4th, 2025)


02-filtering_data.Rmd  

- Takes data/processed/org_data.rds and filters out foundation code 00orgs, social clubs, PO Boxes,  code 04 and 17 foundations,  and filters for appropriate years.  
- It creates the active_orgs.rds and the non_active_orgs.rds.

03-filter_orgs_and_analysis.Rmd 

- Takes processed/active_orgs.rds and  does some additional filtering for orgs with zero assets and creates key variables of interest for plots and analysis and outputs data/processed/formaps/rds and data/processed/foremaps_nozero.rds.: 
  - ASSET_High:TRUE  if asset amount (F990_Total_ASSETS_RECENT column) was >= 500,000 and FALSE if <- 500,000
  - ASSET_High_text: “High Asset” if previous variable was true or “Low Asset”
 if otherwise
  - "ASSET_AMT_log"  = log of the F990_Total_ASSETS_RECENT column (of BMF file??avocado)
  - Percent_AA = Blk_AfAm/Population multiplied by 100 and rounded
  - Majority_AA = Yes  if greater than 50 % and No if less than 50%
  - Neighborhood = Majority Black if previous variable is yes and Majority Non-Black if previous variable is No
  - NTEE_text = conversion of NTEE codes into text so A as “Arts” and “B” as “Education” etc  based on https://urbaninstitute.github.io/nccs-legacy/ntee/ntee.html and https://www.irs.gov/pub/irs-tege/p4838.pdf 

- This file also makes other figures besides maps and stats summaries and tests
- The output files depend on if asset amount was zero respectively for **data/processed/formaps.rds** and **data/processed/foremaps_nozero.rds**: 

04_maps.Rmd 

- This file takes the processed data/processed/formaps.rds (from 03-filter_orgs_and_analysis.Rmd) and neighborhood_shape_data.rds (from 01_prepare_neighborhood_data.Rmd) to make the map figures for the projects. 


Please see this link for a rendered report of our analysis and the steps that we took in analyzing the data: https://jhudatascience.org/Baltimore_nonprofits_assets/. 
