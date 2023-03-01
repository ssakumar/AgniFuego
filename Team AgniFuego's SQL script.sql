-- MySQL script for Team AgniFuego's project

CREATE DATABASE IF NOT EXISTS runways;



-- renaming important columns in the runway table
ALTER TABLE runway RENAME COLUMN `Loc Id` TO Dep_Airport_ID;
ALTER TABLE runway RENAME COLUMN `Runway Id` TO Runway_ID;
ALTER TABLE runway RENAME COLUMN `Surface Type Condition` TO Surface_Type_Condition;
ALTER TABLE runway RENAME COLUMN `WBC Single` TO WBC_Single;
ALTER TABLE runway RENAME COLUMN `WBC Dual` TO WBC_Dual;
ALTER TABLE runway RENAME COLUMN `WBC Two Dual` TO WBC_Two_Dual;
ALTER TABLE runway RENAME COLUMN `WBC Tandem Two Dual` TO WBC_Tandem_Two_Dual;

-- renaming important columns in the airports table
ALTER TABLE airports RENAME COLUMN `Loc Id` TO Dep_Airport_ID;
ALTER TABLE airports RENAME COLUMN `Facility Type` TO Facility_Type;

-- renaming important columns in the airport_schedules table
ALTER TABLE airport_schedules RENAME COLUMN `Loc Id` TO Dep_Airport_ID;
ALTER TABLE airport_schedules RENAME COLUMN `Schedule` TO Schedules;

-- renaming important columns in the firefighting_aircraft table
ALTER TABLE firefighting_aircraft RENAME COLUMN `Departure Airport` TO Dep_Airport_ID;




SELECT * FROM `runways`.`runway`
WHERE  Dep_Airport_ID = '09J';



/* All columns/fields we want to work with: Facility_Type, Schedule, Dep_Airport_ID, Runway_ID, 
Length, Width, Surface_Type_Condition, WBC_Single, WBC_Dual, WBC_Two_Dual, WBC_Tandem_Two_Dual */
SELECT Facility_Type FROM airports;
SELECT Schedules FROM airport_schedules;

SELECT Dep_Airport_ID, Runway_ID, Length, Width, Surface_Type_Condition, WBC_Single, WBC_Dual, WBC_Two_Dual, WBC_Tandem_Two_Dual
FROM runway; 

SELECT a.Facility_Type, a.Dep_Airport_ID, airport_schedules.Schedules
FROM airports a
	JOIN airport_schedules.Schedules 
    ON a.Dep_Airport_ID = airport_schedules.Dep_Airport_ID;
    


/* SELECT Facility_Type, Dep_Airport_ID, Runway_ID, Length, Width, Surface_Type_Condition, WBC_Single, WBC_Dual, WBC_Two_Dual, WBC_Tandem_Two_Dual
FROM */

/* SELECT Facility_Type, Schedule, Dep_Airport_ID, Runway_ID, Length, Width, Surface_Type_Condition, WBC_Single, WBC_Dual, WBC_Two_Dual, WBC_Tandem_Two_Dual
FROM */

 