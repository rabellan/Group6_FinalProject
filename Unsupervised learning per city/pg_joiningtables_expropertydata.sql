DROP TABLE IF EXISTS "PropSold";
CREATE TABLE "PropSold" (
    "Address" varchar(255)   NOT NULL,
    "City" varchar(255)   NOT NULL,
    "Zip" varchar(255)   NOT NULL,
	"SoldDate" Date   NOT NULL,
    "Bathrooms" Numeric   NOT NULL,
    "Bedrooms" Numeric   NOT NULL,
    "LivingArea" Numeric   NOT NULL,
    "LandArea" Numeric   NOT NULL,
    "PropPrice" Numeric   NOT NULL,
    CONSTRAINT "pk_PropSold" PRIMARY KEY (
        "Address"
     )
	);
---
	SELECT * FROM "PropSold";
---
DROP TABLE IF EXISTS "US_Inflation";
CREATE TABLE "US_Inflation" (
 	 "StartDate" Date   NOT NULL,
	 "EndDate" Date   NOT NULL,
    "InflationRate" Numeric   NOT NULL,
	"FederalInt" Numeric   NOT NULL,
	"MonthID" Numeric   NOT NULL,
	"Month_Abs" Numeric   NOT NULL
     );
---
SELECT * FROM "US_Inflation";
---
DROP VIEW IF EXISTS "Sold_Inflation";
CREATE VIEW "Sold_Inflation" AS
-- Joining tables based on date of property purchase occured (between start date and end date on 'updated_inflation.csv')
SELECT "PropSold".*, "US_Inflation"."InflationRate","US_Inflation"."FederalInt","US_Inflation"."MonthID"
FROM "PropSold" 
JOIN "US_Inflation" ON "PropSold"."SoldDate" BETWEEN "US_Inflation"."StartDate" AND "US_Inflation"."EndDate";
---
SELECT * FROM "Sold_Inflation";
COPY (SELECT * FROM "Sold_Inflation") TO '/tmp/Sold_Inflation_M1_12.csv' WITH CSV HEADER;