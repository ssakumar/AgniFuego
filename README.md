# Team Name: AgniFuego

# Aerial Fire Fighting Dashboards and Predictive Analytics
https://public.tableau.com/app/profile/sai.aishwarya.sakamuri4731/viz/Dashboard-WildfireCombating/Fire-FightingAircraftsInformation
# Main Time-Series Analysis Dashboard
https://public.tableau.com/app/profile/spencer.marlen.starr/viz/Time-SeriesAnalysisofUnitedStatesAerialFirefightingOperations_16841213128340/FPW

# Description
This project focuses on developing a real-time dashboard to provide information on operations involved in aerial firefighting across the United States.

Everything having to do with the time-series analysis Dashboard and the forecasting reviewed in our report is in the TimeSeriesAnalysis folder.


# Group Members
Spencer A Marlen Starr - Product Owner 
Sai Aishwarya Sakamuri - GitHub Repository Owner
Nikhil Gudupalli - Scrum Master
Suresh Yeluri - Developer
Tanishq Ravi - Developer

# Project Structure
Dataset-1
flight_histroy.py and scraping.ipynb contains code and credentials for webscrapping
flight_history01.csv has the extracted data until 01/27/2023
tailstouse.txt has the list of tail numbers.
Dataset-2
Using the tail numbers from the text file we are extracting the N-Registry Information form 
https://registry.faa.gov/aircraftinquiry/Search/NNumberInquiry
Dataset-3
The link below provides the dataset for airports and runways
https://adip.faa.gov/agis/public/#/airportSearch/advanced

# Folders In Git
While there are many files that reflect to all our intial struggles to data extraction and cleaning.
The final project files folder consists of the final version of code used to extarction ccleaning and manipulation of data.
And the time series folder contains the R and excel files used for time series prediction models built on SARIMA, Moving Average and Expotential Smoothing.


# Required Resourses

Visual Studio
Jupyter Notebook
Tableau
Excel
R

# Objectives
To continue scraping data from flightware to constantly keep track of the flight path data. And join the data extracted from the FAA N regitry and FAA airport database to this flightaware data in order to build a dashboard that helps in analysying the data for fire-fighting resources and assists in effective decision making through predicitve analytics.



