# Group6_FinalProject
Group 6's Final Project requirement for UC Berkeley Ext Data Analytics Bootcamp

Unsupervised learning models: Property clustering (Anushya):

1) Data cleaning:
- Use the sold data combined raw data file and remove 'unit', 'ity name', 'price per living area' since the calculation is redundant, 'Broker name', 'State', 'Country', 'Broker Agent'(since all cells were null), 'MLS ID', 'Property URL' columns since they are nto relevant to analysis. Change column titles so there are no spaces for easier data import and analysis in Jupyter notebook and PostGres.
- Upload data into jupyter notebook (refer to file 'InitialDataCleaning.ipynb') and use python to format date columns and remove rows with null values. Select only one zip code per city (85225, 97229, 11368, 33186, 90210, 60629) to ensure one city is not over represented
- Export data as 'Cleaned_Sold.csv'
- Create a csv table called 'Cleaned_Inflation' that includes monthly inflation, federal interest rates, abs month ID since start of Property data (Jan 2021 =1, Feb 2024=3i, and Month ID = (Jan =1, Dec =12))
- Upload data into jupyter notebook (refer to file 'InitialDataCleaning.ipynb') and use python to format date columns. Export cleaned file as 'updated_inflation'.csv
- Use PostGres SQL to join tables from Cleaned_Sold.csv & 'updated_inflation'.csv (refer to file 'pg_joiningtables_expropertydata.sql') and export final csv with property values and inflation, federal interest rates and month ID to a file called 'Sold_Inflation_M1_12.csv'

2) Unsupervised learning models - preparing and analyzing data, per city:
Preparing data
- For each city, import the relevant libraries
- Import 'Sold_Inflation_M1_12.csv' and save it as a DataFrame. 
- Convert LandArea to sqft when values seem unusally small (as they are in acres)
- Convert Month ID to dummy variables
- change zipcde so that it is a string & convert in case dummies are used
- Scale numberical feature columns : "Bathrooms", "Bedrooms", "LivingArea","LandArea","PropPrice"
- concat Month ID, inflationrate and federalrate columns
- Create separate dataframes for each city, so they can be analyzed separately
Unsupervised ML: 
- Import relevant libraries for PCA analysis
- Fit the PCA model, determine optimal number of components based on maximum Cumulative  PCA explained variance ratio. Also, adjust features required to optimizize the model (goal: to get the PCA explained variance ratio output as close to 1 as possible).
- Determine the ideal number of clusters (per city) based on the k-means algorithm
- Assign cluster number to each value in the property table, per table
- Create 2D and 3D visuals per city to determine which properties impact property clustering most significantly
Final Jupyter notebook files with per city unsupervised learning manipulations and outcomes:
    - PropertySoldUnsupervised_AZ.ipynb
    - PropertySoldUnsupervised_Chi.ipynb
    - PropertySoldUnsupervised_Fl.ipynb
    - PropertySoldUnsupervised_LA.ipynb
    - PropertySoldUnsupervised_NY.ipynb
    - PropertySoldUnsupervised_OR.ipynb