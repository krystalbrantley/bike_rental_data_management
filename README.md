# Bike Rental Data Management
---
## Project Overview
This project involves exploring, cleaning, and merging Citi Bike ridership data with NOAA weather data to create a PostgreSQL database with analytics-ready views. The objective is to help a bike rental company analyze the impact of weather conditions on bike rentals. 

## Project Overview
* Utilize Jupyter notebook and pandas to explore, clean and transform Citi Bike ridership data
* Design and implement a relational PostgreSQL database schema to store the integrated data
* Develop SQL queries to create analytics-ready views in the database

## Dependencies
* Jupyter Notebook
* pandas library for data manipulation in Python
* [dbdiagram.io](https://dbdiagram.io) a database relationship design tool
* PostgreSQL database

## Instructions
1. Start with the `Bike_Rental_Clean.ipynb`notebook to explore and clean the Citi Bike ridership data.
2. Execute the `bike_rental_ERD.sql` script in [dbdiagram.io](https://dbdiagram.io) to create the PostgreSQL database schema like `bike_rental_ERD.pdf`
3. Run the 'Creating the Database' and 'Creating PostgreSQL Tables' script in `Bike_Rental_Clean.ipynb`to transform and load the integrated data into the PostgreSQL database.
4. Finally, execute the `bike_rental_views.sql` script to create analytics-ready views for the analytics team.

## Necessary Files
Download and unzip the [starter kit](https://www.example.com). The kit contains the following folders:

* ### data
	* `newark_airport_2016.csv`: weather data from Newark airport
	* `JC-2016xx-citibike-tripdata.csv`: twelve files each containing one month of Citi Bike data from Jersey City

* ### data-dictionaries
	* `citibike.pdf`: details on the Citi Bike data files from Citi Bike’s website
	* `weather.pdf`: details on the weather data from NOAA’s website

## Note
Ensure that you have the necessary access rights and credentials to create and manipulate databases in PostgreSQL. Update connection details and file paths as needed in the scripts.# bike_rental_data_management
