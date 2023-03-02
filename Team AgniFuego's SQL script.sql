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
FROM `runways`.`runway`
WHERE  Dep_Airport_ID = '09J';


SELECT Dep_Airport_ID, Runway_ID, Length, Width, Surface_Type_Condition, WBC_Single, WBC_Dual, WBC_Two_Dual, WBC_Tandem_Two_Dual 
FROM `runways`.`runway`
WHERE  Dep_Airport_ID IN ('09J','14A','18A','1V6','22S','2I0','2R4','32S','38S','46U','48A','4S2','65S','6A8','6K4','6K8','6S0','6S3','6S5','74S','77S','7AK','7S0','88AZ','8S0','8S1','9A3','AAO','ABI','ABQ','ABR','ACT','ACV','ACY','ADH','ADK','ADM','ADQ','ADS','AEG','AFW','AGC','AGS','AHN','AIK','AIT','AIZ','AK15','ALM','ALS','ALW','AMA','ANC','ANE','APA','APC','APF','APV','AQO','AQW','ASE','AST','ATW','AUM','AUN','AUS','AVL','AVQ','AWO','AYPY','AZE','BAK','BAM','BBG','BCT','BDL','BDN','BDR','BEA','BET','BFF','BFI','BFL','BFM','BGQ','BGR','BGSF','BHK','BHM','BIG','BIL','BIS','BJC','BJI','BKE','BKS','BKV','BLI','BMT','BNA','BNO','BOI','BOW','BPG','BRD','BRG','BRW','BTF','BTM','BUR','BVO','BVS','BVU','BWG','BWI','BZN','C35','C83','CAT4','CBS8','CDB','CDC','CDS','CDV','CEC','CEW','CEZ','CGI','CHA','CHS','CIC','CLL','CLM','CLW','CMA','CNI','CNO','CNY','COD','COE','COQ','COS','CPR','CPS','CRG','CRP','CRQ','CTB','CTJ','CUB','CVN','CVO','CXO','CXP','CXY','CYCD','CYCQ','CYLW','CYQL','CYQT','CYS','CYSU','CYVR','CYXE','CYXX','CYXY','CYYC','CYYF','CYYG','CYYJ','CYYR','CYZU','CZBB','DAG','DAL','DBQ','DEW','DFI','DHN','DIK','DKX','DLG','DLH','DLN','DLS','DMA','DMN','DNL','DPA','DPG','DRO','DTO','DUT','DVT','DZB','E25','EAR','EAT','ECP','EDF','EDN','EED','EEN','EET','EFD','EGE','EGTC','EKO','EKQ','ELO','ELP','ELY','EMT','ENA','ENN','ENV','ENW','EQY','EUG','EVB','EVV','EVW','EWK','EYW','F05','FAI','FAR','FAT','FBK','FCM','FDK','FET','FFC','FFT','FFZ','FHR','FHU','FLG','FLL','FMM','FMN','FNL','FOT','FPR','FSD','FSM','FTW','FUL','FXE','FYU','FYV','GAL','GCC','GCD','GCK','GEG','GEU','GEY','GGG','GIC','GJT','GKN','GLR','GLW','GMU','GNB','GNC','GON','GPI','GPZ','GRB','GSO','GST','GTF','GTR','GTU','GVT','GYH','GYR','GYY','HAF','HDN','HEF','HEZ','HFY','HIB','HIF','HII','HIO','HLA','HLN','HMP','HMT','HND','HNL','HNS','HOM','HON','HOT','HOU','HPB','HRF','HSA','HSP','HUM','HUT','HXD','HZD','I18','IAB','IAD','IAH','ICT','IDA','IFP','IGM','IND','INL','INS','INW','IOB','IRK','ISM','ITH','ITO','IWA','JAC','JAN','JAX','JBR','JER','JFZ','JMS','JNU','JQF','JTC','JWN','JYO','JZI','JZP','KTN','KVC','L35','LAF','LAL','LAN','LAR','LAS','LAX','LBB','LBF','LBL','LCQ','LFT','LGB','LGD','LHM','LIT','LKV','LLJ','LMT','LND','LNK','LOL','LOZ','LSE','LTY','LUD','LUK','LVK','LVS','LWA','LWS','LWT','LZU','M02','M17','M25','M29','M54','MAF','MAN','MBY','MCC','MCE','MCG','MCO','MEI','MER','MEV','MFR','MHR','MIA','MIT','MKC','MKJS','MKL','MKT','MKY','MLB','MLI','MLS','MLU','MLY','MMAA','MMCL','MMHO','MMLP','MMPR','MMSD','MMTM','MMTP','MMU','MMV','MMVR','MMZH','MNV','MOD','MPTO','MQI','MRB','MRF','MRI','MRY','MSO','MSP','MTJ','MVI','MWC','MWH','MWL','MYAF','MYAM','MYL','MZBZ','MZJ','NEW','NLC','NQA','NSTU','NUL','NUQ','NYL','O22','O32','OAK','OCF','ODO','OGD','OGG','OKC','OLM','OLS','OMA','OME','ONO','ONP','ONT','OPN','ORL','OSC','OTH','OWD','OXR','OZW','P13','P20','P52','PAE','PAH','PAN','PAQ','PBV','PDK','PDT','PDX','PEO','PGA','PGUM','PHL','PHT','PHX','PIA','PIH','PIR','PKMJ','PLN','PMD','PNC','PNE','POU','PRB','PRC','PSC','PSG','PSP','PTV','PUB','PUC','PUW','PVF','PVU','RAP','RBG','RBL','RCE','RDD','RDM','REO','RFD','RIC','RID','RIF','RIL','RIV','RJAA','RKD','RKS','RMN','RNO','RNT','ROA','ROW','RRT','RST','RSW','RTS','RVF','RYN','RYY','RZR','S21','S25','S33','S39','S52','S97','SAA','SAC','SAD','SAF','SAN','SAT','SAV','SAW','SBA','SBD','SBP','SBS','SC3','SCK','SDL','SDP','SDY','SEZ','SFF','SFM','SFO','SGF','SGS','SGT','SGU','SHR','SHV','SIK','SIT','SIY','SJC','SJS','SJT','SKX','SLC','SLE','SLI','SMF','SMN','SMX','SNA','SNP','SNS','SNY','SOP','SPB','SPF','SPI','SPS','SRQ','SSF','STP','STS','SUA','SUE','SUN','SVC','SVH','SWI','SXQ','SZT','T31','T82','TAL','TCM','TIW','TIX','TKX','TLH','TME','TMK','TOA','TOL','TOP','TRI','TRK','TRL','TRM','TUL','TUS','TVC','TVL','TVR','TWF','TWM','TXK','TYS','U10','U42','UAO','UBW','UGN','UHPP','UKI','UNI','UNV','UOX','UVA','VCT','VDI','VDZ','VEL','VGT','VIH','VKS','VNC','VNY','VQQ','VUO','WDR','WHP','WJF','WRG','WVI','WWD','WYS','X21','X60','XBP','XWA','Y51','YAK','YKM','YKN');




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
SELECT * FROM airports
WHERE runway.Dep_Airport_ID = airports.Dep_Airport_ID;

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

 
 
 