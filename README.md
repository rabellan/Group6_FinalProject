# Group6 Final Project
Group 6's Final Project requirement for UC Berkeley Ext Data Analytics Bootcamp

## Collaborators:
- [Anushya Mani](https://github.com/nooshi87)
- [Brandon Ingalz](https://github.com/Bingalz)
- [Diahann Castellon](https://github.com/Diahann-c)
- [Jimmy Nguyen](https://github.com/sleepyjimbo1)
- [Roland Abellano](https://github.com/rabellan)

## Our group's goal was to analyze various trends within the real estate market using machine learning.

We exported data directly off of Zillow using a google plug-in and settled on Los Angeles, New York, Chandler, Chicago, Miami and Portland as they represent the largest metropolitan cities within the United States covering various regions. We gathered data on property that was for sale, for rent and sold within the last 36 months. 

### Technologies Used:

- Postress SQL DB
- Zillow Data Explorer Google Plug-in
- Python Libraries
    - Pandas
    - NumPy
    - Matplotlib
    - Seaborn
    - Scikit-learn

### Group 6's project Data Engineering is courtesy of our team's data engineer, [Diahann Castellon](https://github.com/Diahann-c)

## Analysis

### [Real Estate Radar Price Prediction For Both Rental & Sale Properties (Brandon Ingalz and Jimmy Nguyen)](https://github.com/rabellan/Group6_FinalProject/blob/Brandon/Price%20Estimate%20Rent%20vs%20Buy%20Analysis/Updated%20Rent%20vs%20Buy%20Price%20Estimate%20%26%20Analysis.md)

**Overview**

This project aims to predict real estate prices for rentals and sales using data analysis and machine learning, employing linear regression and random forest algorithms. It utilizes two datasets, one for rentals and one for sales, and includes a comparison model for price estimates based on specific criteria. Analysis revealed a positive but weak correlation between rental prices and property size, bedrooms, and bathrooms, indicating these factors modestly influence rental prices. However, it also notes that external factors like neighborhood and city location play significant roles in determining rental rates.

### [Supervise learning models: Price Cut Predictor (Roland Abellano):](https://github.com/rabellan/Group6_FinalProject/tree/main/Price_Cut)

**Overview**

For the supervised machine learning modeling, Decision Tree and Random Forest models were used to predict price cuts on properties across Los Angeles, Miami, and Chicago, using OneHotEncoder for data preprocessing. The project emphasized the importance of rigorous data preprocessing, careful model choice, and thorough validation to create reliable and generalizable machine learning models.

**Methodology**
1. Data cleaning
    - Using MS Excel, from the original files in the **"Updated Data/For Sale"** folder from **main** branch, **Roland** updated the "Zillow_CityName_For_Sale.csv
        - Included feature "FederalInt" for federal Interest Rate
        - Null values for NON-categorical features were replaced with 0 
        - Eliminated rows of "Property type", "Lot/land" to take away data that might throw off the balance of the dataset since most properties sold were "Single Family," "Condominium," "Unknown," and "Multi-Family"
            - The rows of "Lot/Land" Property type were typically BEYOND the square footage of the other property types.
2. Supervised learning models - decision tree, decision tree with final feature engineering using OneHotEncoder, and random forest
    - The vanilla "decision tree" and "random forest" (read: wothout feature engineering) usage was straight forward to establish baseline prediction accuracy.
        - For most part, the vanilla version of the supervised ML models chosen was showing accuracy rate of ~62%
    - **Roland** added monthly inflation rate, but the vanilla supervised ML model yield the same under performing accuracy
    - **Roland** played with several features (see below) to figure out which one might yield better results for the prediction accuracy
        - City
        - Broker name
        - Lot/land area unit
    - In the end, the "Property type" categorical feature was the one that bumped up the precision performance of the supervised model by combining it with using OneHotEncoder and **pipeline** fitting.


### [Unsupervised learning per city models: Property clustering (Anushya):](https://github.com/rabellan/Group6_FinalProject/tree/main/Unsupervised%20learning%20per%20city)

**Methodology**
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

