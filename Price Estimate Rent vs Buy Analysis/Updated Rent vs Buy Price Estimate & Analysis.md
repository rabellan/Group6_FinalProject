# Real Estate Radar Price Prediction For Both Rental & Sale Properties

## Overview
This project focuses on predicting real estate prices for both rental and sale properties using exploratory data analysis (EDA) and machine learning techniques. The data includes two datasets: one for rental properties and the other for properties available for sale. The predictive models are built using linear regression and random forest regressor algorithms. Additionally, a comparison model is developed to provide estimated prices to users based on specific parameters. We created a heat map on the correlation of variables on rental prices. While there's redundancy in this graph, focus on the top row. In relation to rental price, we have a positive correlation with the living area, which tells us how large a property is by acres or square feet, the number of bedrooms, and the number of bathrooms. The positive correlation with these variables indicates that more rooms and greater size contributes to larger rental prices. However, the positive correlation isn't strong, so these are only some indicators that go into price. Other factors unrelated to the physical property itself, such as neighborhood and city location, sway rental prices too.

## Dataset
- **Rental Dataset**: Contains information about rental properties including rental price, living area, number of bedrooms and bathrooms, city, and state.
- **Sale Dataset**: Contains information about properties available for sale including similar attributes as the rental dataset.

## Exploratory Data Analysis (EDA)
EDA was conducted on both datasets to gain insights into the distribution and relationships of variables. This step involved data cleaning, visualization, and statistical analysis to understand the key factors influencing real estate prices.

## Predictive Modeling
- **Linear Regression**: A linear regression model was trained using features such as property type, living area, bedrooms, bathrooms, city, and state to predict prices.
- **Random Forest Regressor**: A random forest regressor model was employed to capture non-linear relationships and provide more accurate predictions.

## Comparison Model
A comparison model was developed to allow users to input specific parameters such as property type, living area, bedrooms, bathrooms, city, and state, and obtain an estimated price based on these factors.

## Usage
To use the comparison model:
1. Input the required parameters.
2. Run the comparison model script.
3. Obtain the estimated price based on the input parameters.

## Requirements
- Python 3.x
- Libraries: pandas, numpy, scikit-learn, matplotlib, seaborn

## Usage Example
```python
# Ask the user to input the property details
property_type = "Single Family"
living_area = 2000
lot_area = 10000
bedrooms = 3
bathrooms = 2
state = "CA"
city = "Chicago"

sales_price = sales_model_lr.predict(sale_price_prediction)
rental_price = rental_model_lr.predict(rental_price_prediction)

print("The estimated sale price is: ", sales_price[0], "USD")
print("The estimated rental price is: ", rental_price[0],"USD")

