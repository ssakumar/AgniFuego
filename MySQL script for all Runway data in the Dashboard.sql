
CREATE DATABASE IF NOT EXISTS dashboard_runways_data;

SELECT * FROM `dashboard_runways_data`.`dash_runways`;


SELECT * FROM `dashboard_runways_data`.`dash_airports`;
SELECT * FROM `dashboard_runways_data`.`runways_table`;
SELECT * FROM `dashboard_runways_data`.`dash_air_scheds`;



-- inner join of dash_air_scheds on dash_airports
SELECT dash_air_scheds.Dep_Airport_ID, dash_airports.ARP_Latitude, dash_airports.ARP_Longitude, dash_air_scheds.`Schedules`, dash_airports.Facility_Type, dash_airports.Wind_Indicator
FROM `dashboard_runways_data`.dash_air_scheds
INNER JOIN `dashboard_runways_data`.dash_airports ON dash_air_scheds.Dep_Airport_ID = dash_airports.Dep_Airport_ID;

-- inner join of dash_airports on dash_runs
SELECT dash_airports.Dep_Airport_ID, dash_airports.ARP_Latitude, dash_airports.ARP_Longitude, dash_airports.Facility_Type, dash_airports.Wind_Indicator, drs.Runway_ID, drs.Num_of_Runways, drs.Length, drs.Width, drs.Surface_Type_Condition, drs.Edge_Light_Intensity, drs.WBC_Single, drs.WBC_Dual, drs.WBC_Two_Dual, drs.WBC_Tandem_Two_Dual, drs.Base_Marking_Condition
FROM `dashboard_runways_data`.dash_airports
INNER JOIN `dashboard_runways_data`.dash_runways AS drs ON dash_airports.Dep_Airport_ID = drs.Dep_Airport_ID;

-- inner join of dash_air_scheds on dash_runs
SELECT dash_air_scheds.Dep_Airport_ID, dash_air_scheds.Schedules, drs.Runway_ID, drs.Num_of_Runways, drs.Length, drs.Width, drs.Surface_Type_Condition, drs.Edge_Light_Intensity, drs.WBC_Single, drs.WBC_Dual, drs.WBC_Two_Dual, drs.WBC_Tandem_Two_Dual, drs.Base_Marking_Condition
FROM `dashboard_runways_data`.dash_air_scheds
INNER JOIN `dashboard_runways_data`.dash_runways AS drs ON dash_air_scheds.Dep_Airport_ID = drs.Dep_Airport_ID;



-- Runway table query, version 1
SELECT dasda.Dep_Airport_ID, dasda.ARP_Latitude, dasda.ARP_Longitude, dasda.Schedules, dasda.Facility_Type, dasda.Wind_Indicator, drs.Num_of_Runways, drs.Length, drs.Width, drs.Surface_Type_Condition, drs.Edge_Light_Intensity, drs.WBC_Single, drs.WBC_Dual, drs.WBC_Two_Dual, drs.WBC_Tandem_Two_Dual, drs.Base_Marking_Condition
FROM `dashboard_runways_data`.dash_air_scheds_on_dash_airports AS dasda
INNER JOIN `dashboard_runways_data`.dash_runways AS drs ON dasda.Dep_Airport_ID = drs.Dep_Airport_ID;

-- Runway table query, version 2
SELECT dasdr.Dep_Airport_ID, dasdr.Schedules, dash_airports.ARP_Latitude, dash_airports.ARP_Longitude, dash_airports.Facility_Type, dash_airports.Wind_Indicator, dasdr.Runway_ID, dasdr.Num_of_Runways,dasdr.Length, dasdr.Width, dasdr.Surface_Type_Condition, dasdr.Edge_Light_Intensity, dasdr.WBC_Single, dasdr.WBC_Dual, dasdr.WBC_Two_Dual, dasdr.WBC_Tandem_Two_Dual, dasdr.Base_Marking_Condition 
FROM `dashboard_runways_data`.dash_air_scheds_on_dash_runs AS dasdr
INNER JOIN `dashboard_runways_data`.dash_airports ON dasdr.Dep_Airport_ID = dash_airports.Dep_Airport_ID;





