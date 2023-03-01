-- MySQL script for Team AgniFuego's project

CREATE DATABASE IF NOT EXISTS runways;

ALTER TABLE runway RENAME COLUMN `Loc Id` TO Dep_Airport_ID;
ALTER TABLE airports RENAME COLUMN `Loc Id` TO Dep_Airport_ID;
ALTER TABLE airport_schedules RENAME COLUMN `Loc Id` TO Dep_Airport_ID;


ALTER TABLE airports RENAME COLUMN `Facility Type` TO Facility_Type;
ALTER TABLE airport_schedules RENAME COLUMN `Loc Id` TO Dep_Airport_ID;


SELECT Loc.Id FROM `runways`.`runway`;

SELECT Length
FROM `runways`.`runway`;

SELECT * FROM `runways`.`runway`;

SELECT * FROM `runways`.`runway`
WHERE  Dep_Airport_ID = '09J';






 