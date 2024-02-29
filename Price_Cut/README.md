Supervise learning models: Price Cut Predictor (Roland Abellano):

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
