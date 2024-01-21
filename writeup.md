# Bike Rental Data Management
---

## Table of Contents
* #### [Introduction](#intro-id)
* #### [Preparing the data](#prepare-id)
* #### [Creating a schema](#schema-id)
* #### [Creating the database](#database-id)
* #### [Creating views](#views-id)
* #### [Conclusion](#conclusion-id)
  
---
## Introduction {#intro-id}

I worked with a year's worth of bike rental data provided by Citi Bike and weather data from the National Oceanic and Atmospheric Administration (NOAA). The end goal was to produce a well-organized PostgreSQL database and develop views to facilitate analysis for the company's analytics team, in understanding the effects of weather on bike rentals. In undertaking the development process for the Bike Rental Data Management project, my approach was guided by a combination of data exploration, cleaning, integration, and database design principles. 

 --- 
## Preparing the data {#prepare-id}
[Jupyter Notebook](./Bike_Rental_Clean.ipynb)

**Approach:**
Leveraging Jupyter notebook and the pandas library for Python, I concatenated the 12 data files (one for each month in 2016) into a single dataframe to perform initial exploration and cleaning of the Citi Bike ridership data. My initial observations identified data quality issues such as missing rider demographic data. While the missing data is a small percentage of the total, plotting the data and looking at distributions indicated that it might not be missing at random.
Furthermore, I investigated the trip durations for the Citi Bike ridership data. There was a suspiciously large maximum trip length of 189 days. According to the data dictionary, Citi Bike policies state the maximum length of a trip is 24 hours.

**Decision-Making:**
Given the real-world nature of datasets, I chose to keep the data but replace the missing values with an unknown category, so the analytics team can investigate further and keep track of the issue. I also created a column to flag trips that violate borrowing policies, which analysts might want to investigate.

---
## Creating a schema {#schema-id}
[Bike Rental Entity Relationship Diagram](./bike_rental_ERD.pdf)

**Approach:**
I chose PostgreSQL as the relational database to store the integrated data. While cleaning and transforming the data, I employed normalization techniques to design a well-organized database schema for data integrity. I checked for null values, duplicates, and any repetitive data I could split into multiple tables.

**Decision-Making:**
 The decision to use dbdiagram.io was based on simple use of using SQL code to draw entity relationship diagrams. I used primary keys and foreign keys to establish relationships and enable efficient querying of the tables I created.

---
## Creating the database {#database-id}
[Jupyter Notebook](./Bike_Rental_Clean.ipynb)

**Approach:**
I chose the psycopg2 library and developed Python code to load the cleaned and merged data into the PostgreSQL database.

**Decision-Making:**
Psycopg2 was chosen for its ability to efficiently interact with PostgreSQL, connect with the database and execute SQL queries.

---
## Creating views {#views-id}
[Bike Rental Views](./bike_rental_views.sql)

**Approach:**
I decided to create views within the database to ensure the analysts have access to pre-cleaned data, reducing the need for repetitive transformations. I used SQL queries to create analytics-ready views within the PostgreSQL database.

**Decision-Making:** 
I created a view for daily ride counts which allows analysts to see the various ride totals based on customer type for each day of the year.
I also created a view for daily weather and ride totals, so analysts may see the effects of weather on bike rentals.
Lastly, a view called late returns was created for analysts to investigate the rides that violate Citi Bike borrowing policy.

---
## Conclusion {#conclusion-id}

My approach to the development process aimed to strike a balance between technical proficiency and a thoughtful approach to data handling. I made decisions about the tools, language to use, and design of the database schema, with the end goal of providing a robust and efficient solution for the analytics team to derive useful insights from the bike rental and weather data. The iterative nature of the process allowed for learning and adjustments, based on new insights and challenges encountered along the way.