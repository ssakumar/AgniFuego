-- MySQL script for Team AgniFuego's project

CREATE DATABASE IF NOT EXISTS runways;



desc runway;
-- renaming important columns in the runway table
ALTER TABLE runway RENAME COLUMN `Loc Id` TO Dep_Airport_ID;
ALTER TABLE runway RENAME COLUMN `Runway Id` TO Runway_ID;
ALTER TABLE runway RENAME COLUMN `Surface Type Condition` TO Surface_Type_Condition;
ALTER TABLE runway RENAME COLUMN `WBC Single` TO WBC_Single;
ALTER TABLE runway RENAME COLUMN `WBC Dual` TO WBC_Dual;
ALTER TABLE runway RENAME COLUMN `WBC Two Dual` TO WBC_Two_Dual;
ALTER TABLE runway RENAME COLUMN `WBC Tandem Two Dual` TO WBC_Tandem_Two_Dual;

ALTER TABLE runway RENAME COLUMN `Site Id` TO Site_ID;
ALTER TABLE runway RENAME COLUMN `Surface Treatment` TO Surface_Treatment;
ALTER TABLE runway RENAME COLUMN `Edge Light Intensity` TO Edge_Light_Intensity;
ALTER TABLE runway RENAME COLUMN `Length Source` TO Length_Source;
ALTER TABLE runway RENAME COLUMN `Length Source` TO Length_Source_Date;

/* ALTER TABLE runway ADD COLUMN ID int NOT NULL PRIMARY KEY;
ALTER TABLE runway ADD PRIMARY KEY(ID);
ALTER TABLE runway DROP COLUMN ID;
ALTER TABLE runway ADD PRIMARY KEY (ID);
SHOW INDEX FROM runways.runway WHERE Key_name = 'PRIMARY'; */


desc airports;
-- renaming important columns in the airports table
ALTER TABLE airports RENAME COLUMN `Loc Id` TO Dep_Airport_ID;
ALTER TABLE airports RENAME COLUMN `Facility Type` TO Facility_Type;

ALTER TABLE airports RENAME COLUMN `Site Id` TO Site_ID;
ALTER TABLE airports RENAME COLUMN `State Id` TO State_ID;
ALTER TABLE airports RENAME COLUMN `Effective Date` TO Effective_Date;
ALTER TABLE airports RENAME COLUMN `Activation Date` TO Activation_Date;
ALTER TABLE airports RENAME COLUMN `Operations Date` TO Operations_Date;
ALTER TABLE airports RENAME COLUMN `ARP Latitude` TO ARP_Latitude;
ALTER TABLE airports RENAME COLUMN `ARP Latitude Sec` TO ARP_Latitude_Sec;
ALTER TABLE airports RENAME COLUMN `ARP Longitude` TO ARP_Longitude;
ALTER TABLE airports RENAME COLUMN `ARP Longitude Sec` TO ARP_Longitude_Sec;
ALTER TABLE airports RENAME COLUMN `ARP Method` TO ARP_Method;
ALTER TABLE airports RENAME COLUMN `Land Area` TO Land_Area;
ALTER TABLE airports RENAME COLUMN `Airport Status Code` TO Airport_Status_Code;
ALTER TABLE airports RENAME COLUMN `Airspace Determination` TO Airspace_Determination;
ALTER TABLE airports RENAME COLUMN `Fuel Types` TO Fuel_Types;
ALTER TABLE airports RENAME COLUMN `Fuel Available` TO Fuel_Available;
ALTER TABLE airports RENAME COLUMN `Single Engine Aircraft` TO Single_Engine_Aircraft;
ALTER TABLE airports RENAME COLUMN `Multi Engine Aircraft` TO Multi_Engine_Aircraft;
ALTER TABLE airports RENAME COLUMN `Jet Engine Aircraft` TO Jet_Engine_Aircraft;
ALTER TABLE airports RENAME COLUMN `Inspection Method` TO Inspection_Method;
ALTER TABLE airports RENAME COLUMN `Last Inspection Date` TO Last_Inspection_Date;



desc airport_schedules;
-- renaming important columns in the airport_schedules table
ALTER TABLE airport_schedules RENAME COLUMN `Loc Id` TO Dep_Airport_ID;
ALTER TABLE airport_schedules RENAME COLUMN `Schedule` TO Schedules;
ALTER TABLE airport_schedules RENAME COLUMN `Site Id` TO Site_ID;
ALTER TABLE airport_schedules RENAME COLUMN `ICAO Id` TO ICAO_ID;
ALTER TABLE airport_schedules RENAME COLUMN `State Id` TO State_ID;


desc firefighting_aircraft;
-- renaming important columns in the firefighting_aircraft table
ALTER TABLE firefighting_aircraft RENAME COLUMN `Departure Airport` TO Dep_Airport_ID;




/* All columns/fields we want to work with: Facility_Type, Schedule, Dep_Airport_ID, Runway_ID, 
Length, Width, Surface_Type_Condition, WBC_Single, WBC_Dual, WBC_Two_Dual, WBC_Tandem_Two_Dual */
SELECT Facility_Type FROM airports;
SELECT Schedules FROM airport_schedules;

SELECT Dep_Airport_ID, Runway_ID, Length, Width, Surface_Type_Condition, WBC_Single, WBC_Dual, WBC_Two_Dual, WBC_Tandem_Two_Dual
FROM runway; 

SELECT Dep_Airport_ID, Runway_ID, Length, Width, Surface_Type_Condition, WBC_Single, WBC_Dual, WBC_Two_Dual, WBC_Tandem_Two_Dual 
FROM `runways`.`runway`
WHERE  Dep_Airport_ID = '09J';

SELECT Dep_Airport_ID, Runway_ID, Length, Width, Surface_Type_Condition, WBC_Single, WBC_Dual, WBC_Two_Dual, WBC_Tandem_Two_Dual 
FROM `runways`.`runway`
WHERE  Dep_Airport_ID = '14A';

SELECT Dep_Airport_ID, Runway_ID, Length, Width, Surface_Type_Condition, WBC_Single, WBC_Dual, WBC_Two_Dual, WBC_Tandem_Two_Dual 
FROM `runways`.`runway`
WHERE  Dep_Airport_ID IN ('09J', '14A', '18A', '1V6', '22S', '2I0', '2R4', '32S', '38S', '46U', '48A', '4S2', '65S', '6A8');


show open tables where in_use>0;
show processlist;
kill 11;
kill 35;


desc runway;
ALTER TABLE runway ADD COLUMN Facility_Type TEXT;
ALTER TABLE runway DROP COLUMN Facility_Type;
ALTER TABLE runway ADD COLUMN Schedules TEXT;
ALTER TABLE runway DROP COLUMN Schedules;


UPDATE runway
LEFT JOIN airports ON runway.Dep_Airport_ID = airports.Dep_Airport_ID
SET runway.Facility_Type = airports.Facility_Type
WHERE `runway`.`Dep_Airport_ID` = `airports`.`Dep_Airport_ID`;

UPDATE runway r
LEFT JOIN airport_schedules sch ON r.Dep_Airport_ID = sch.Dep_Airport_ID
SET r.Schedules = sch.Schedules
WHERE r.Dep_Airport_ID = sch.Dep_Airport_ID;

UPDATE runway r
LEFT JOIN airport_schedules sch ON r.Dep_Airport_ID = sch.Dep_Airport_ID
SET r.Schedules = sch.Schedules;

UPDATE runway r
LEFT JOIN airport_schedules sch ON r.Dep_Airport_ID = sch.Dep_Airport_ID
SET r.Schedules = sch.Schedules
WHERE Site_ID IS NOT NULL;



INSERT INTO runway (Facility_Type)
SELECT Facility_Type FROM airports
WHERE runway.Dep_Airport_ID = airports.Dep_Airport_ID;


INSERT INTO runway (Schedules)
SELECT Schedules FROM airport_schedules
WHERE runway.Dep_Airport_ID = airport_schedules.Dep_Airport_ID;



SELECT Facility_Type FROM runway;
SELECT Schedules FROM runway;
SELECT * FROM runway;


SELECT a.Facility_Type, a.Dep_Airport_ID, airport_schedules.Schedules
FROM airports a
	JOIN airport_schedules.Schedules 
    ON a.Dep_Airport_ID = airport_schedules.Dep_Airport_ID;
    


/* SELECT Facility_Type, Dep_Airport_ID, Runway_ID, Length, Width, Surface_Type_Condition, WBC_Single, WBC_Dual, WBC_Two_Dual, WBC_Tandem_Two_Dual
FROM */

/* SELECT Facility_Type, Schedule, Dep_Airport_ID, Runway_ID, Length, Width, Surface_Type_Condition, WBC_Single, WBC_Dual, WBC_Two_Dual, WBC_Tandem_Two_Dual
FROM */

 
 
 