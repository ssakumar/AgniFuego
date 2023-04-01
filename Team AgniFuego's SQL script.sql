-- MySQL script for Team AgniFuego's project

CREATE DATABASE IF NOT EXISTS airportandrunway;

USE airportandrunway;


desc runway;
-- renaming important columns in the runway table


/* ALTER TABLE runway ADD COLUMN ID int NOT NULL PRIMARY KEY;
ALTER TABLE runway ADD PRIMARY KEY(ID);
ALTER TABLE runway DROP COLUMN ID;
ALTER TABLE runway ADD PRIMARY KEY (ID);
SHOW INDEX FROM runways.runway WHERE Key_name = 'PRIMARY'; */

SELECT * FROM Airports_Table;
desc airports;


-- time to prepare the airport_schedules table
desc airport_schedules;
-- renaming important columns in the airport_schedules table


-- time to prepare the runway_counts table


-- time to prepare the firefighting_aircraft
desc firefighting_aircraft;
-- renaming important columns in the firefighting_aircraft table


-- time to prepare the final_runway_info table
desc final_runway_info;




/*  All columns/fields we want to work with: Facility_Type Wind_Indicator, Schedule, Dep_Airport_ID, Runway_ID, 
Length, Width, Surface_Type_Condition, WBC_Single, WBC_Dual, WBC_Two_Dual, WBC_Tandem_Two_Dual, Base Marking Condition  
*/

--  START OF THE QUERIES & COMMANDS THAT WORK
-- create the dash_runs table (without runways counts)
SELECT Dep_Airport_ID, Runway_ID, `Length`, Width, Surface_Type_Condition, Edge_Light_Intensity, WBC_Single, WBC_Dual, WBC_Two_Dual, WBC_Tandem_Two_Dual, Base_Marking_Condition 
FROM `runways`.`runway`
WHERE  Dep_Airport_ID IN ('09J','14A','18A','1V6','22S','2I0','2R4','32S','38S','46U','48A','4S2','65S','6A8','6K4','6K8','6S0','6S3','6S5','74S','77S','7AK','7S0','88AZ','8S0','8S1','9A3','AAO','ABI','ABQ','ABR','ACT','ACV','ACY','ADH','ADK','ADM','ADQ','ADS','AEG','AFW','AGC','AGS','AHN','AIK','AIT','AIZ','AK15','ALM','ALS','ALW','AMA','ANC','ANE','APA','APC','APF','APV','AQO','AQW','ASE','AST','ATW','AUM','AUN','AUS','AVL','AVQ','AWO','AYPY','AZE','BAK','BAM','BBG','BCT','BDL','BDN','BDR','BEA','BET','BFF','BFI','BFL','BFM','BGQ','BGR','BGSF','BHK','BHM','BIG','BIL','BIS','BJC','BJI','BKE','BKS','BKV','BLI','BMT','BNA','BNO','BOI','BOW','BPG','BRD','BRG','BRW','BTF','BTM','BUR','BVO','BVS','BVU','BWG','BWI','BZN','C35','C83','CAT4','CBS8','CDB','CDC','CDS','CDV','CEC','CEW','CEZ','CGI','CHA','CHS','CIC','CLL','CLM','CLW','CMA','CNI','CNO','CNY','COD','COE','COQ','COS','CPR','CPS','CRG','CRP','CRQ','CTB','CTJ','CUB','CVN','CVO','CXO','CXP','CXY','CYCD','CYCQ','CYLW','CYQL','CYQT','CYS','CYSU','CYVR','CYXE','CYXX','CYXY','CYYC','CYYF','CYYG','CYYJ','CYYR','CYZU','CZBB','DAG','DAL','DBQ','DEW','DFI','DHN','DIK','DKX','DLG','DLH','DLN','DLS','DMA','DMN','DNL','DPA','DPG','DRO','DTO','DUT','DVT','DZB','E25','EAR','EAT','ECP','EDF','EDN','EED','EEN','EET','EFD','EGE','EGTC','EKO','EKQ','ELO','ELP','ELY','EMT','ENA','ENN','ENV','ENW','EQY','EUG','EVB','EVV','EVW','EWK','EYW','F05','FAI','FAR','FAT','FBK','FCM','FDK','FET','FFC','FFT','FFZ','FHR','FHU','FLG','FLL','FMM','FMN','FNL','FOT','FPR','FSD','FSM','FTW','FUL','FXE','FYU','FYV','GAL','GCC','GCD','GCK','GEG','GEU','GEY','GGG','GIC','GJT','GKN','GLR','GLW','GMU','GNB','GNC','GON','GPI','GPZ','GRB','GSO','GST','GTF','GTR','GTU','GVT','GYH','GYR','GYY','HAF','HDN','HEF','HEZ','HFY','HIB','HIF','HII','HIO','HLA','HLN','HMP','HMT','HND','HNL','HNS','HOM','HON','HOT','HOU','HPB','HRF','HSA','HSP','HUM','HUT','HXD','HZD','I18','IAB','IAD','IAH','ICT','IDA','IFP','IGM','IND','INL','INS','INW','IOB','IRK','ISM','ITH','ITO','IWA','JAC','JAN','JAX','JBR','JER','JFZ','JMS','JNU','JQF','JTC','JWN','JYO','JZI','JZP','KTN','KVC','L35','LAF','LAL','LAN','LAR','LAS','LAX','LBB','LBF','LBL','LCQ','LFT','LGB','LGD','LHM','LIT','LKV','LLJ','LMT','LND','LNK','LOL','LOZ','LSE','LTY','LUD','LUK','LVK','LVS','LWA','LWS','LWT','LZU','M02','M17','M25','M29','M54','MAF','MAN','MBY','MCC','MCE','MCG','MCO','MEI','MER','MEV','MFR','MHR','MIA','MIT','MKC','MKJS','MKL','MKT','MKY','MLB','MLI','MLS','MLU','MLY','MMAA','MMCL','MMHO','MMLP','MMPR','MMSD','MMTM','MMTP','MMU','MMV','MMVR','MMZH','MNV','MOD','MPTO','MQI','MRB','MRF','MRI','MRY','MSO','MSP','MTJ','MVI','MWC','MWH','MWL','MYAF','MYAM','MYL','MZBZ','MZJ','NEW','NLC','NQA','NSTU','NUL','NUQ','NYL','O22','O32','OAK','OCF','ODO','OGD','OGG','OKC','OLM','OLS','OMA','OME','ONO','ONP','ONT','OPN','ORL','OSC','OTH','OWD','OXR','OZW','P13','P20','P52','PAE','PAH','PAN','PAQ','PBV','PDK','PDT','PDX','PEO','PGA','PGUM','PHL','PHT','PHX','PIA','PIH','PIR','PKMJ','PLN','PMD','PNC','PNE','POU','PRB','PRC','PSC','PSG','PSP','PTV','PUB','PUC','PUW','PVF','PVU','RAP','RBG','RBL','RCE','RDD','RDM','REO','RFD','RIC','RID','RIF','RIL','RIV','RJAA','RKD','RKS','RMN','RNO','RNT','ROA','ROW','RRT','RST','RSW','RTS','RVF','RYN','RYY','RZR','S21','S25','S33','S39','S52','S97','SAA','SAC','SAD','SAF','SAN','SAT','SAV','SAW','SBA','SBD','SBP','SBS','SC3','SCK','SDL','SDP','SDY','SEZ','SFF','SFM','SFO','SGF','SGS','SGT','SGU','SHR','SHV','SIK','SIT','SIY','SJC','SJS','SJT','SKX','SLC','SLE','SLI','SMF','SMN','SMX','SNA','SNP','SNS','SNY','SOP','SPB','SPF','SPI','SPS','SRQ','SSF','STP','STS','SUA','SUE','SUN','SVC','SVH','SWI','SXQ','SZT','T31','T82','TAL','TCM','TIW','TIX','TKX','TLH','TME','TMK','TOA','TOL','TOP','TRI','TRK','TRL','TRM','TUL','TUS','TVC','TVL','TVR','TWF','TWM','TXK','TYS','U10','U42','UAO','UBW','UGN','UHPP','UKI','UNI','UNV','UOX','UVA','VCT','VDI','VDZ','VEL','VGT','VIH','VKS','VNC','VNY','VQQ','VUO','WDR','WHP','WJF','WRG','WVI','WWD','WYS','X21','X60','XBP','XWA','Y51','YAK','YKM','YKN');
-- create the dash_runs table (with runways counts)
SELECT rc.Dep_Airport_ID, r.Runway_ID, rc.Num_of_Runways, r.`Length`, r.Width, r.Surface_Type_Condition, r.Edge_Light_Intensity, r.WBC_Single, r.WBC_Dual, r.WBC_Two_Dual, r.WBC_Tandem_Two_Dual, r.Base_Marking_Condition
FROM runway_counts as rc
INNER JOIN `runways`.`runway` as r ON rc.Dep_Airport_ID = r.Dep_Airport_ID
WHERE  rc.Dep_Airport_ID IN ('09J','14A','18A','1V6','22S','2I0','2R4','32S','38S','46U','48A','4S2','65S','6A8','6K4','6K8','6S0','6S3','6S5','74S','77S','7AK','7S0','88AZ','8S0','8S1','9A3','AAO','ABI','ABQ','ABR','ACT','ACV','ACY','ADH','ADK','ADM','ADQ','ADS','AEG','AFW','AGC','AGS','AHN','AIK','AIT','AIZ','AK15','ALM','ALS','ALW','AMA','ANC','ANE','APA','APC','APF','APV','AQO','AQW','ASE','AST','ATW','AUM','AUN','AUS','AVL','AVQ','AWO','AYPY','AZE','BAK','BAM','BBG','BCT','BDL','BDN','BDR','BEA','BET','BFF','BFI','BFL','BFM','BGQ','BGR','BGSF','BHK','BHM','BIG','BIL','BIS','BJC','BJI','BKE','BKS','BKV','BLI','BMT','BNA','BNO','BOI','BOW','BPG','BRD','BRG','BRW','BTF','BTM','BUR','BVO','BVS','BVU','BWG','BWI','BZN','C35','C83','CAT4','CBS8','CDB','CDC','CDS','CDV','CEC','CEW','CEZ','CGI','CHA','CHS','CIC','CLL','CLM','CLW','CMA','CNI','CNO','CNY','COD','COE','COQ','COS','CPR','CPS','CRG','CRP','CRQ','CTB','CTJ','CUB','CVN','CVO','CXO','CXP','CXY','CYCD','CYCQ','CYLW','CYQL','CYQT','CYS','CYSU','CYVR','CYXE','CYXX','CYXY','CYYC','CYYF','CYYG','CYYJ','CYYR','CYZU','CZBB','DAG','DAL','DBQ','DEW','DFI','DHN','DIK','DKX','DLG','DLH','DLN','DLS','DMA','DMN','DNL','DPA','DPG','DRO','DTO','DUT','DVT','DZB','E25','EAR','EAT','ECP','EDF','EDN','EED','EEN','EET','EFD','EGE','EGTC','EKO','EKQ','ELO','ELP','ELY','EMT','ENA','ENN','ENV','ENW','EQY','EUG','EVB','EVV','EVW','EWK','EYW','F05','FAI','FAR','FAT','FBK','FCM','FDK','FET','FFC','FFT','FFZ','FHR','FHU','FLG','FLL','FMM','FMN','FNL','FOT','FPR','FSD','FSM','FTW','FUL','FXE','FYU','FYV','GAL','GCC','GCD','GCK','GEG','GEU','GEY','GGG','GIC','GJT','GKN','GLR','GLW','GMU','GNB','GNC','GON','GPI','GPZ','GRB','GSO','GST','GTF','GTR','GTU','GVT','GYH','GYR','GYY','HAF','HDN','HEF','HEZ','HFY','HIB','HIF','HII','HIO','HLA','HLN','HMP','HMT','HND','HNL','HNS','HOM','HON','HOT','HOU','HPB','HRF','HSA','HSP','HUM','HUT','HXD','HZD','I18','IAB','IAD','IAH','ICT','IDA','IFP','IGM','IND','INL','INS','INW','IOB','IRK','ISM','ITH','ITO','IWA','JAC','JAN','JAX','JBR','JER','JFZ','JMS','JNU','JQF','JTC','JWN','JYO','JZI','JZP','KTN','KVC','L35','LAF','LAL','LAN','LAR','LAS','LAX','LBB','LBF','LBL','LCQ','LFT','LGB','LGD','LHM','LIT','LKV','LLJ','LMT','LND','LNK','LOL','LOZ','LSE','LTY','LUD','LUK','LVK','LVS','LWA','LWS','LWT','LZU','M02','M17','M25','M29','M54','MAF','MAN','MBY','MCC','MCE','MCG','MCO','MEI','MER','MEV','MFR','MHR','MIA','MIT','MKC','MKJS','MKL','MKT','MKY','MLB','MLI','MLS','MLU','MLY','MMAA','MMCL','MMHO','MMLP','MMPR','MMSD','MMTM','MMTP','MMU','MMV','MMVR','MMZH','MNV','MOD','MPTO','MQI','MRB','MRF','MRI','MRY','MSO','MSP','MTJ','MVI','MWC','MWH','MWL','MYAF','MYAM','MYL','MZBZ','MZJ','NEW','NLC','NQA','NSTU','NUL','NUQ','NYL','O22','O32','OAK','OCF','ODO','OGD','OGG','OKC','OLM','OLS','OMA','OME','ONO','ONP','ONT','OPN','ORL','OSC','OTH','OWD','OXR','OZW','P13','P20','P52','PAE','PAH','PAN','PAQ','PBV','PDK','PDT','PDX','PEO','PGA','PGUM','PHL','PHT','PHX','PIA','PIH','PIR','PKMJ','PLN','PMD','PNC','PNE','POU','PRB','PRC','PSC','PSG','PSP','PTV','PUB','PUC','PUW','PVF','PVU','RAP','RBG','RBL','RCE','RDD','RDM','REO','RFD','RIC','RID','RIF','RIL','RIV','RJAA','RKD','RKS','RMN','RNO','RNT','ROA','ROW','RRT','RST','RSW','RTS','RVF','RYN','RYY','RZR','S21','S25','S33','S39','S52','S97','SAA','SAC','SAD','SAF','SAN','SAT','SAV','SAW','SBA','SBD','SBP','SBS','SC3','SCK','SDL','SDP','SDY','SEZ','SFF','SFM','SFO','SGF','SGS','SGT','SGU','SHR','SHV','SIK','SIT','SIY','SJC','SJS','SJT','SKX','SLC','SLE','SLI','SMF','SMN','SMX','SNA','SNP','SNS','SNY','SOP','SPB','SPF','SPI','SPS','SRQ','SSF','STP','STS','SUA','SUE','SUN','SVC','SVH','SWI','SXQ','SZT','T31','T82','TAL','TCM','TIW','TIX','TKX','TLH','TME','TMK','TOA','TOL','TOP','TRI','TRK','TRL','TRM','TUL','TUS','TVC','TVL','TVR','TWF','TWM','TXK','TYS','U10','U42','UAO','UBW','UGN','UHPP','UKI','UNI','UNV','UOX','UVA','VCT','VDI','VDZ','VEL','VGT','VIH','VKS','VNC','VNY','VQQ','VUO','WDR','WHP','WJF','WRG','WVI','WWD','WYS','X21','X60','XBP','XWA','Y51','YAK','YKM','YKN');
SELECT * FROM dash_runs;

-- create the dash_airports table
SELECT Dep_Airport_ID, ARP_Latitude, ARP_Longitude, Facility_Type, Wind_Indicator FROM airports 
WHERE  Dep_Airport_ID IN ('09J','14A','18A','1V6','22S','2I0','2R4','32S','38S','46U','48A','4S2','65S','6A8','6K4','6K8','6S0','6S3','6S5','74S','77S','7AK','7S0','88AZ','8S0','8S1','9A3','AAO','ABI','ABQ','ABR','ACT','ACV','ACY','ADH','ADK','ADM','ADQ','ADS','AEG','AFW','AGC','AGS','AHN','AIK','AIT','AIZ','AK15','ALM','ALS','ALW','AMA','ANC','ANE','APA','APC','APF','APV','AQO','AQW','ASE','AST','ATW','AUM','AUN','AUS','AVL','AVQ','AWO','AYPY','AZE','BAK','BAM','BBG','BCT','BDL','BDN','BDR','BEA','BET','BFF','BFI','BFL','BFM','BGQ','BGR','BGSF','BHK','BHM','BIG','BIL','BIS','BJC','BJI','BKE','BKS','BKV','BLI','BMT','BNA','BNO','BOI','BOW','BPG','BRD','BRG','BRW','BTF','BTM','BUR','BVO','BVS','BVU','BWG','BWI','BZN','C35','C83','CAT4','CBS8','CDB','CDC','CDS','CDV','CEC','CEW','CEZ','CGI','CHA','CHS','CIC','CLL','CLM','CLW','CMA','CNI','CNO','CNY','COD','COE','COQ','COS','CPR','CPS','CRG','CRP','CRQ','CTB','CTJ','CUB','CVN','CVO','CXO','CXP','CXY','CYCD','CYCQ','CYLW','CYQL','CYQT','CYS','CYSU','CYVR','CYXE','CYXX','CYXY','CYYC','CYYF','CYYG','CYYJ','CYYR','CYZU','CZBB','DAG','DAL','DBQ','DEW','DFI','DHN','DIK','DKX','DLG','DLH','DLN','DLS','DMA','DMN','DNL','DPA','DPG','DRO','DTO','DUT','DVT','DZB','E25','EAR','EAT','ECP','EDF','EDN','EED','EEN','EET','EFD','EGE','EGTC','EKO','EKQ','ELO','ELP','ELY','EMT','ENA','ENN','ENV','ENW','EQY','EUG','EVB','EVV','EVW','EWK','EYW','F05','FAI','FAR','FAT','FBK','FCM','FDK','FET','FFC','FFT','FFZ','FHR','FHU','FLG','FLL','FMM','FMN','FNL','FOT','FPR','FSD','FSM','FTW','FUL','FXE','FYU','FYV','GAL','GCC','GCD','GCK','GEG','GEU','GEY','GGG','GIC','GJT','GKN','GLR','GLW','GMU','GNB','GNC','GON','GPI','GPZ','GRB','GSO','GST','GTF','GTR','GTU','GVT','GYH','GYR','GYY','HAF','HDN','HEF','HEZ','HFY','HIB','HIF','HII','HIO','HLA','HLN','HMP','HMT','HND','HNL','HNS','HOM','HON','HOT','HOU','HPB','HRF','HSA','HSP','HUM','HUT','HXD','HZD','I18','IAB','IAD','IAH','ICT','IDA','IFP','IGM','IND','INL','INS','INW','IOB','IRK','ISM','ITH','ITO','IWA','JAC','JAN','JAX','JBR','JER','JFZ','JMS','JNU','JQF','JTC','JWN','JYO','JZI','JZP','KTN','KVC','L35','LAF','LAL','LAN','LAR','LAS','LAX','LBB','LBF','LBL','LCQ','LFT','LGB','LGD','LHM','LIT','LKV','LLJ','LMT','LND','LNK','LOL','LOZ','LSE','LTY','LUD','LUK','LVK','LVS','LWA','LWS','LWT','LZU','M02','M17','M25','M29','M54','MAF','MAN','MBY','MCC','MCE','MCG','MCO','MEI','MER','MEV','MFR','MHR','MIA','MIT','MKC','MKJS','MKL','MKT','MKY','MLB','MLI','MLS','MLU','MLY','MMAA','MMCL','MMHO','MMLP','MMPR','MMSD','MMTM','MMTP','MMU','MMV','MMVR','MMZH','MNV','MOD','MPTO','MQI','MRB','MRF','MRI','MRY','MSO','MSP','MTJ','MVI','MWC','MWH','MWL','MYAF','MYAM','MYL','MZBZ','MZJ','NEW','NLC','NQA','NSTU','NUL','NUQ','NYL','O22','O32','OAK','OCF','ODO','OGD','OGG','OKC','OLM','OLS','OMA','OME','ONO','ONP','ONT','OPN','ORL','OSC','OTH','OWD','OXR','OZW','P13','P20','P52','PAE','PAH','PAN','PAQ','PBV','PDK','PDT','PDX','PEO','PGA','PGUM','PHL','PHT','PHX','PIA','PIH','PIR','PKMJ','PLN','PMD','PNC','PNE','POU','PRB','PRC','PSC','PSG','PSP','PTV','PUB','PUC','PUW','PVF','PVU','RAP','RBG','RBL','RCE','RDD','RDM','REO','RFD','RIC','RID','RIF','RIL','RIV','RJAA','RKD','RKS','RMN','RNO','RNT','ROA','ROW','RRT','RST','RSW','RTS','RVF','RYN','RYY','RZR','S21','S25','S33','S39','S52','S97','SAA','SAC','SAD','SAF','SAN','SAT','SAV','SAW','SBA','SBD','SBP','SBS','SC3','SCK','SDL','SDP','SDY','SEZ','SFF','SFM','SFO','SGF','SGS','SGT','SGU','SHR','SHV','SIK','SIT','SIY','SJC','SJS','SJT','SKX','SLC','SLE','SLI','SMF','SMN','SMX','SNA','SNP','SNS','SNY','SOP','SPB','SPF','SPI','SPS','SRQ','SSF','STP','STS','SUA','SUE','SUN','SVC','SVH','SWI','SXQ','SZT','T31','T82','TAL','TCM','TIW','TIX','TKX','TLH','TME','TMK','TOA','TOL','TOP','TRI','TRK','TRL','TRM','TUL','TUS','TVC','TVL','TVR','TWF','TWM','TXK','TYS','U10','U42','UAO','UBW','UGN','UHPP','UKI','UNI','UNV','UOX','UVA','VCT','VDI','VDZ','VEL','VGT','VIH','VKS','VNC','VNY','VQQ','VUO','WDR','WHP','WJF','WRG','WVI','WWD','WYS','X21','X60','XBP','XWA','Y51','YAK','YKM','YKN');

-- create the dash_air_scheds table
SELECT Dep_Airport_ID, Schedules FROM airport_schedules
WHERE  Dep_Airport_ID IN ('09J','14A','18A','1V6','22S','2I0','2R4','32S','38S','46U','48A','4S2','65S','6A8','6K4','6K8','6S0','6S3','6S5','74S','77S','7AK','7S0','88AZ','8S0','8S1','9A3','AAO','ABI','ABQ','ABR','ACT','ACV','ACY','ADH','ADK','ADM','ADQ','ADS','AEG','AFW','AGC','AGS','AHN','AIK','AIT','AIZ','AK15','ALM','ALS','ALW','AMA','ANC','ANE','APA','APC','APF','APV','AQO','AQW','ASE','AST','ATW','AUM','AUN','AUS','AVL','AVQ','AWO','AYPY','AZE','BAK','BAM','BBG','BCT','BDL','BDN','BDR','BEA','BET','BFF','BFI','BFL','BFM','BGQ','BGR','BGSF','BHK','BHM','BIG','BIL','BIS','BJC','BJI','BKE','BKS','BKV','BLI','BMT','BNA','BNO','BOI','BOW','BPG','BRD','BRG','BRW','BTF','BTM','BUR','BVO','BVS','BVU','BWG','BWI','BZN','C35','C83','CAT4','CBS8','CDB','CDC','CDS','CDV','CEC','CEW','CEZ','CGI','CHA','CHS','CIC','CLL','CLM','CLW','CMA','CNI','CNO','CNY','COD','COE','COQ','COS','CPR','CPS','CRG','CRP','CRQ','CTB','CTJ','CUB','CVN','CVO','CXO','CXP','CXY','CYCD','CYCQ','CYLW','CYQL','CYQT','CYS','CYSU','CYVR','CYXE','CYXX','CYXY','CYYC','CYYF','CYYG','CYYJ','CYYR','CYZU','CZBB','DAG','DAL','DBQ','DEW','DFI','DHN','DIK','DKX','DLG','DLH','DLN','DLS','DMA','DMN','DNL','DPA','DPG','DRO','DTO','DUT','DVT','DZB','E25','EAR','EAT','ECP','EDF','EDN','EED','EEN','EET','EFD','EGE','EGTC','EKO','EKQ','ELO','ELP','ELY','EMT','ENA','ENN','ENV','ENW','EQY','EUG','EVB','EVV','EVW','EWK','EYW','F05','FAI','FAR','FAT','FBK','FCM','FDK','FET','FFC','FFT','FFZ','FHR','FHU','FLG','FLL','FMM','FMN','FNL','FOT','FPR','FSD','FSM','FTW','FUL','FXE','FYU','FYV','GAL','GCC','GCD','GCK','GEG','GEU','GEY','GGG','GIC','GJT','GKN','GLR','GLW','GMU','GNB','GNC','GON','GPI','GPZ','GRB','GSO','GST','GTF','GTR','GTU','GVT','GYH','GYR','GYY','HAF','HDN','HEF','HEZ','HFY','HIB','HIF','HII','HIO','HLA','HLN','HMP','HMT','HND','HNL','HNS','HOM','HON','HOT','HOU','HPB','HRF','HSA','HSP','HUM','HUT','HXD','HZD','I18','IAB','IAD','IAH','ICT','IDA','IFP','IGM','IND','INL','INS','INW','IOB','IRK','ISM','ITH','ITO','IWA','JAC','JAN','JAX','JBR','JER','JFZ','JMS','JNU','JQF','JTC','JWN','JYO','JZI','JZP','KTN','KVC','L35','LAF','LAL','LAN','LAR','LAS','LAX','LBB','LBF','LBL','LCQ','LFT','LGB','LGD','LHM','LIT','LKV','LLJ','LMT','LND','LNK','LOL','LOZ','LSE','LTY','LUD','LUK','LVK','LVS','LWA','LWS','LWT','LZU','M02','M17','M25','M29','M54','MAF','MAN','MBY','MCC','MCE','MCG','MCO','MEI','MER','MEV','MFR','MHR','MIA','MIT','MKC','MKJS','MKL','MKT','MKY','MLB','MLI','MLS','MLU','MLY','MMAA','MMCL','MMHO','MMLP','MMPR','MMSD','MMTM','MMTP','MMU','MMV','MMVR','MMZH','MNV','MOD','MPTO','MQI','MRB','MRF','MRI','MRY','MSO','MSP','MTJ','MVI','MWC','MWH','MWL','MYAF','MYAM','MYL','MZBZ','MZJ','NEW','NLC','NQA','NSTU','NUL','NUQ','NYL','O22','O32','OAK','OCF','ODO','OGD','OGG','OKC','OLM','OLS','OMA','OME','ONO','ONP','ONT','OPN','ORL','OSC','OTH','OWD','OXR','OZW','P13','P20','P52','PAE','PAH','PAN','PAQ','PBV','PDK','PDT','PDX','PEO','PGA','PGUM','PHL','PHT','PHX','PIA','PIH','PIR','PKMJ','PLN','PMD','PNC','PNE','POU','PRB','PRC','PSC','PSG','PSP','PTV','PUB','PUC','PUW','PVF','PVU','RAP','RBG','RBL','RCE','RDD','RDM','REO','RFD','RIC','RID','RIF','RIL','RIV','RJAA','RKD','RKS','RMN','RNO','RNT','ROA','ROW','RRT','RST','RSW','RTS','RVF','RYN','RYY','RZR','S21','S25','S33','S39','S52','S97','SAA','SAC','SAD','SAF','SAN','SAT','SAV','SAW','SBA','SBD','SBP','SBS','SC3','SCK','SDL','SDP','SDY','SEZ','SFF','SFM','SFO','SGF','SGS','SGT','SGU','SHR','SHV','SIK','SIT','SIY','SJC','SJS','SJT','SKX','SLC','SLE','SLI','SMF','SMN','SMX','SNA','SNP','SNS','SNY','SOP','SPB','SPF','SPI','SPS','SRQ','SSF','STP','STS','SUA','SUE','SUN','SVC','SVH','SWI','SXQ','SZT','T31','T82','TAL','TCM','TIW','TIX','TKX','TLH','TME','TMK','TOA','TOL','TOP','TRI','TRK','TRL','TRM','TUL','TUS','TVC','TVL','TVR','TWF','TWM','TXK','TYS','U10','U42','UAO','UBW','UGN','UHPP','UKI','UNI','UNV','UOX','UVA','VCT','VDI','VDZ','VEL','VGT','VIH','VKS','VNC','VNY','VQQ','VUO','WDR','WHP','WJF','WRG','WVI','WWD','WYS','X21','X60','XBP','XWA','Y51','YAK','YKM','YKN');


-- inner join of dash_air_scheds on dash_airports
SELECT dash_air_scheds.Dep_Airport_ID, dash_airports.ARP_Latitude, dash_airports.ARP_Longitude, dash_air_scheds.Schedules, dash_airports.Facility_Type, dash_airports.Wind_Indicator
FROM dash_air_scheds
INNER JOIN dash_airports ON dash_air_scheds.Dep_Airport_ID = dash_airports.Dep_Airport_ID;

-- inner join of dash_airports on dash_runs
SELECT dash_airports.Dep_Airport_ID, dash_airports.ARP_Latitude, dash_airports.ARP_Longitude, dash_airports.Facility_Type, dash_airports.Wind_Indicator, dash_runs.Runway_ID, dash_runs.Num_of_Runways, dash_runs.Length, dash_runs.Width, dash_runs.Surface_Type_Condition, dash_runs.Edge_Light_Intensity, dash_runs.WBC_Single, dash_runs.WBC_Dual, dash_runs.WBC_Two_Dual, dash_runs.WBC_Tandem_Two_Dual, dash_runs.Base_Marking_Condition 
FROM dash_airports
INNER JOIN dash_runs ON dash_airports.Dep_Airport_ID = dash_runs.Dep_Airport_ID;

-- inner join of dash_air_scheds on dash_runs
SELECT dash_air_scheds.Dep_Airport_ID, dash_air_scheds.Schedules, dash_runs.Runway_ID, dash_runs.Num_of_Runways, dash_runs.Length, dash_runs.Width, dash_runs.Surface_Type_Condition, dash_runs.Edge_Light_Intensity, dash_runs.WBC_Single, dash_runs.WBC_Dual, dash_runs.WBC_Two_Dual, dash_runs.WBC_Tandem_Two_Dual, dash_runs.Base_Marking_Condition 
FROM dash_air_scheds
INNER JOIN dash_runs ON dash_air_scheds.Dep_Airport_ID = dash_runs.Dep_Airport_ID;
-- QUERIES & COMMANDS THAT WORK: END



-- Runway table query with runway IDs included, version 1
SELECT rc.Dep_Airport_ID, rc.Num_of_Runways, rt.Schedules, rt.Facility_Type, rt.Wind_Indicator, rt.Runway_ID, rt.Length, rt.Width, rt.Surface_Type_Condition, rt.Edge_Light_Intensity, rt.WBC_Single, rt.WBC_Dual, rt.WBC_Two_Dual, rt.WBC_Tandem_Two_Dual, rt.Base_Marking_Condition 
FROM runway_counts AS rc
INNER JOIN runways_table AS rt ON rc.Dep_Airport_ID = rt.Dep_Airport_ID;

-- Runway table query, version 2
SELECT dasdr.Dep_Airport_ID, dasdr.Schedules, dash_airports.Facility_Type, dash_airports.Wind_Indicator, dasdr.Runway_ID, dasdr.Length, dasdr.Width, dasdr.Surface_Type_Condition, dasdr.Edge_Light_Intensity, dasdr.WBC_Single, dasdr.WBC_Dual, dasdr.WBC_Two_Dual, dasdr.WBC_Tandem_Two_Dual, dasdr.Base_Marking_Condition 
FROM dash_air_scheds_on_dash_runs AS dasdr
INNER JOIN dash_airports ON dasdr.Dep_Airport_ID = dash_airports.Dep_Airport_ID;


-- do all the same operations but only include the WHERE clause in the final query this time
SELECT * FROM airport_schedules_on_airports;
SELECT * FROM airports;
-- inner join of airport_schedules on airports
SELECT airport_schedules.Dep_Airport_ID, airport_schedules.Schedules, airports.ARP_Latitude, airports.ARP_Longitude, airports.Facility_Type, airports.Wind_Indicator
FROM airport_schedules
INNER JOIN airports ON airport_schedules.Dep_Airport_ID = airports.Dep_Airport_ID;

SELECT rc.Dep_Airport_ID, r.Runway_ID, rc.Num_of_Runways, r.`Length`, r.Width, r.Surface_Type_Condition, r.Edge_Light_Intensity, r.WBC_Single, r.WBC_Dual, r.WBC_Two_Dual, r.WBC_Tandem_Two_Dual, r.Base_Marking_Condition
FROM runway_counts as rc
LEFT JOIN `runways`.`runway` as r ON rc.Dep_Airport_ID = r.Dep_Airport_ID;
-- Runway table query, version 3
SELECT sch.Dep_Airport_ID, sch.Schedules, sch.ARP_Latitude, sch.ARP.Longitude, sch.Facility_Type, sch.Wind_Indicator, run.Runway_ID, run.Num_of_Runways, run.Length, run.Width, run.Surface_Type_Condition, run.Edge_Light_Intensity, run.WBC_Single, run.WBC_Dual, run.WBC_Two_Dual, run.WBC_Tandem_Two_Dual, run.Base_Marking_Condition
FROM `airport_schedules_on_airports (without WHERE clause)` AS sch
INNER JOIN runway AS run ON sch.Dep_Airport_ID = run.Dep_Airport_ID
WHERE sch.Dep_Airport_ID IN ('09J','14A','18A','1V6','22S','2I0','2R4','32S','38S','46U','48A','4S2','65S','6A8','6K4','6K8','6S0','6S3','6S5','74S','77S','7AK','7S0','88AZ','8S0','8S1','9A3','AAO','ABI','ABQ','ABR','ACT','ACV','ACY','ADH','ADK','ADM','ADQ','ADS','AEG','AFW','AGC','AGS','AHN','AIK','AIT','AIZ','AK15','ALM','ALS','ALW','AMA','ANC','ANE','APA','APC','APF','APV','AQO','AQW','ASE','AST','ATW','AUM','AUN','AUS','AVL','AVQ','AWO','AYPY','AZE','BAK','BAM','BBG','BCT','BDL','BDN','BDR','BEA','BET','BFF','BFI','BFL','BFM','BGQ','BGR','BGSF','BHK','BHM','BIG','BIL','BIS','BJC','BJI','BKE','BKS','BKV','BLI','BMT','BNA','BNO','BOI','BOW','BPG','BRD','BRG','BRW','BTF','BTM','BUR','BVO','BVS','BVU','BWG','BWI','BZN','C35','C83','CAT4','CBS8','CDB','CDC','CDS','CDV','CEC','CEW','CEZ','CGI','CHA','CHS','CIC','CLL','CLM','CLW','CMA','CNI','CNO','CNY','COD','COE','COQ','COS','CPR','CPS','CRG','CRP','CRQ','CTB','CTJ','CUB','CVN','CVO','CXO','CXP','CXY','CYCD','CYCQ','CYLW','CYQL','CYQT','CYS','CYSU','CYVR','CYXE','CYXX','CYXY','CYYC','CYYF','CYYG','CYYJ','CYYR','CYZU','CZBB','DAG','DAL','DBQ','DEW','DFI','DHN','DIK','DKX','DLG','DLH','DLN','DLS','DMA','DMN','DNL','DPA','DPG','DRO','DTO','DUT','DVT','DZB','E25','EAR','EAT','ECP','EDF','EDN','EED','EEN','EET','EFD','EGE','EGTC','EKO','EKQ','ELO','ELP','ELY','EMT','ENA','ENN','ENV','ENW','EQY','EUG','EVB','EVV','EVW','EWK','EYW','F05','FAI','FAR','FAT','FBK','FCM','FDK','FET','FFC','FFT','FFZ','FHR','FHU','FLG','FLL','FMM','FMN','FNL','FOT','FPR','FSD','FSM','FTW','FUL','FXE','FYU','FYV','GAL','GCC','GCD','GCK','GEG','GEU','GEY','GGG','GIC','GJT','GKN','GLR','GLW','GMU','GNB','GNC','GON','GPI','GPZ','GRB','GSO','GST','GTF','GTR','GTU','GVT','GYH','GYR','GYY','HAF','HDN','HEF','HEZ','HFY','HIB','HIF','HII','HIO','HLA','HLN','HMP','HMT','HND','HNL','HNS','HOM','HON','HOT','HOU','HPB','HRF','HSA','HSP','HUM','HUT','HXD','HZD','I18','IAB','IAD','IAH','ICT','IDA','IFP','IGM','IND','INL','INS','INW','IOB','IRK','ISM','ITH','ITO','IWA','JAC','JAN','JAX','JBR','JER','JFZ','JMS','JNU','JQF','JTC','JWN','JYO','JZI','JZP','KTN','KVC','L35','LAF','LAL','LAN','LAR','LAS','LAX','LBB','LBF','LBL','LCQ','LFT','LGB','LGD','LHM','LIT','LKV','LLJ','LMT','LND','LNK','LOL','LOZ','LSE','LTY','LUD','LUK','LVK','LVS','LWA','LWS','LWT','LZU','M02','M17','M25','M29','M54','MAF','MAN','MBY','MCC','MCE','MCG','MCO','MEI','MER','MEV','MFR','MHR','MIA','MIT','MKC','MKJS','MKL','MKT','MKY','MLB','MLI','MLS','MLU','MLY','MMAA','MMCL','MMHO','MMLP','MMPR','MMSD','MMTM','MMTP','MMU','MMV','MMVR','MMZH','MNV','MOD','MPTO','MQI','MRB','MRF','MRI','MRY','MSO','MSP','MTJ','MVI','MWC','MWH','MWL','MYAF','MYAM','MYL','MZBZ','MZJ','NEW','NLC','NQA','NSTU','NUL','NUQ','NYL','O22','O32','OAK','OCF','ODO','OGD','OGG','OKC','OLM','OLS','OMA','OME','ONO','ONP','ONT','OPN','ORL','OSC','OTH','OWD','OXR','OZW','P13','P20','P52','PAE','PAH','PAN','PAQ','PBV','PDK','PDT','PDX','PEO','PGA','PGUM','PHL','PHT','PHX','PIA','PIH','PIR','PKMJ','PLN','PMD','PNC','PNE','POU','PRB','PRC','PSC','PSG','PSP','PTV','PUB','PUC','PUW','PVF','PVU','RAP','RBG','RBL','RCE','RDD','RDM','REO','RFD','RIC','RID','RIF','RIL','RIV','RJAA','RKD','RKS','RMN','RNO','RNT','ROA','ROW','RRT','RST','RSW','RTS','RVF','RYN','RYY','RZR','S21','S25','S33','S39','S52','S97','SAA','SAC','SAD','SAF','SAN','SAT','SAV','SAW','SBA','SBD','SBP','SBS','SC3','SCK','SDL','SDP','SDY','SEZ','SFF','SFM','SFO','SGF','SGS','SGT','SGU','SHR','SHV','SIK','SIT','SIY','SJC','SJS','SJT','SKX','SLC','SLE','SLI','SMF','SMN','SMX','SNA','SNP','SNS','SNY','SOP','SPB','SPF','SPI','SPS','SRQ','SSF','STP','STS','SUA','SUE','SUN','SVC','SVH','SWI','SXQ','SZT','T31','T82','TAL','TCM','TIW','TIX','TKX','TLH','TME','TMK','TOA','TOL','TOP','TRI','TRK','TRL','TRM','TUL','TUS','TVC','TVL','TVR','TWF','TWM','TXK','TYS','U10','U42','UAO','UBW','UGN','UHPP','UKI','UNI','UNV','UOX','UVA','VCT','VDI','VDZ','VEL','VGT','VIH','VKS','VNC','VNY','VQQ','VUO','WDR','WHP','WJF','WRG','WVI','WWD','WYS','X21','X60','XBP','XWA','Y51','YAK','YKM','YKN');


-- inner join of airport_schedules on runway
SELECT airport_schedules.Dep_Airport_ID, airport_schedules.Schedules, runway.Runway_ID, runway.Length, runway.Width, runway.Surface_Type_Condition, runway.Edge_Light_Intensity, runway.WBC_Single, runway.WBC_Dual, runway.WBC_Two_Dual, runway.WBC_Tandem_Two_Dual, runway.Base_Marking_Condition
FROM airport_schedules
INNER JOIN runway ON airport_schedules.Dep_Airport_ID = runway.Dep_Airport_ID;


-- Runway table query, version 4  
SELECT  fri.Dep_Airport_ID, fri.Schedules, da.runway_ID, da.num, da.Length, da.Width, da.`Surface Type Condition`, da.`Edge Light Intensity`, da.`WBC Single`, da.`WBC Dual`, da.`WBC Two Dual`, da.`WBC Tandem Two Dual`, da.`Base Marking Condition` 
FROM dash_airports AS da 
LEFT OUTER JOIN final_runway_info fri ON da.Dep_Airport_ID = fri.Dep_Airport_ID;

-- Runway table query, version 4  
SELECT  da.Dep_Airport_ID, da.ARP_Latitude, da.ARP_Longitude, fri.`Runway ID`, fri.Length, fri.Width, fri.`Surface Type Condition`, fri.`Edge Light Intensity`, fri.`WBC Single`, fri.`WBC Dual`, fri.`WBC Two Dual`, fri.`WBC Tandem Two Dual`, fri.`Base Marking Condition` 
FROM dash_airports AS da 
LEFT OUTER JOIN final_runway_info fri ON da.Dep_Airport_ID = fri.Dep_Airport_ID;








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

 
 
 SELECT Dep_Airport_ID, Schedules FROM airport_schedules
WHERE  Dep_Airport_ID IN ('09J','14A','18A','1V6','22S','2I0','2R4','32S','38S','46U','48A','4S2','65S','6A8','6K4','6K8','6S0','6S3','6S5','74S','77S','7AK','7S0','88AZ','8S0','8S1','9A3','AAO','ABI','ABQ','ABR','ACT','ACV','ACY','ADH','ADK','ADM','ADQ','ADS','AEG','AFW','AGC','AGS','AHN','AIK','AIT','AIZ','AK15','ALM','ALS','ALW','AMA','ANC','ANE','APA','APC','APF','APV','AQO','AQW','ASE','AST','ATW','AUM','AUN','AUS','AVL','AVQ','AWO','AYPY','AZE','BAK','BAM','BBG','BCT','BDL','BDN','BDR','BEA','BET','BFF','BFI','BFL','BFM','BGQ','BGR','BGSF','BHK','BHM','BIG','BIL','BIS','BJC','BJI','BKE','BKS','BKV','BLI','BMT','BNA','BNO','BOI','BOW','BPG','BRD','BRG','BRW','BTF','BTM','BUR','BVO','BVS','BVU','BWG','BWI','BZN','C35','C83','CAT4','CBS8','CDB','CDC','CDS','CDV','CEC','CEW','CEZ','CGI','CHA','CHS','CIC','CLL','CLM','CLW','CMA','CNI','CNO','CNY','COD','COE','COQ','COS','CPR','CPS','CRG','CRP','CRQ','CTB','CTJ','CUB','CVN','CVO','CXO','CXP','CXY','CYCD','CYCQ','CYLW','CYQL','CYQT','CYS','CYSU','CYVR','CYXE','CYXX','CYXY','CYYC','CYYF','CYYG','CYYJ','CYYR','CYZU','CZBB','DAG','DAL','DBQ','DEW','DFI','DHN','DIK','DKX','DLG','DLH','DLN','DLS','DMA','DMN','DNL','DPA','DPG','DRO','DTO','DUT','DVT','DZB','E25','EAR','EAT','ECP','EDF','EDN','EED','EEN','EET','EFD','EGE','EGTC','EKO','EKQ','ELO','ELP','ELY','EMT','ENA','ENN','ENV','ENW','EQY','EUG','EVB','EVV','EVW','EWK','EYW','F05','FAI','FAR','FAT','FBK','FCM','FDK','FET','FFC','FFT','FFZ','FHR','FHU','FLG','FLL','FMM','FMN','FNL','FOT','FPR','FSD','FSM','FTW','FUL','FXE','FYU','FYV','GAL','GCC','GCD','GCK','GEG','GEU','GEY','GGG','GIC','GJT','GKN','GLR','GLW','GMU','GNB','GNC','GON','GPI','GPZ','GRB','GSO','GST','GTF','GTR','GTU','GVT','GYH','GYR','GYY','HAF','HDN','HEF','HEZ','HFY','HIB','HIF','HII','HIO','HLA','HLN','HMP','HMT','HND','HNL','HNS','HOM','HON','HOT','HOU','HPB','HRF','HSA','HSP','HUM','HUT','HXD','HZD','I18','IAB','IAD','IAH','ICT','IDA','IFP','IGM','IND','INL','INS','INW','IOB','IRK','ISM','ITH','ITO','IWA','JAC','JAN','JAX','JBR','JER','JFZ','JMS','JNU','JQF','JTC','JWN','JYO','JZI','JZP','KTN','KVC','L35','LAF','LAL','LAN','LAR','LAS','LAX','LBB','LBF','LBL','LCQ','LFT','LGB','LGD','LHM','LIT','LKV','LLJ','LMT','LND','LNK','LOL','LOZ','LSE','LTY','LUD','LUK','LVK','LVS','LWA','LWS','LWT','LZU','M02','M17','M25','M29','M54','MAF','MAN','MBY','MCC','MCE','MCG','MCO','MEI','MER','MEV','MFR','MHR','MIA','MIT','MKC','MKJS','MKL','MKT','MKY','MLB','MLI','MLS','MLU','MLY','MMAA','MMCL','MMHO','MMLP','MMPR','MMSD','MMTM','MMTP','MMU','MMV','MMVR','MMZH','MNV','MOD','MPTO','MQI','MRB','MRF','MRI','MRY','MSO','MSP','MTJ','MVI','MWC','MWH','MWL','MYAF','MYAM','MYL','MZBZ','MZJ','NEW','NLC','NQA','NSTU','NUL','NUQ','NYL','O22','O32','OAK','OCF','ODO','OGD','OGG','OKC','OLM','OLS','OMA','OME','ONO','ONP','ONT','OPN','ORL','OSC','OTH','OWD','OXR','OZW','P13','P20','P52','PAE','PAH','PAN','PAQ','PBV','PDK','PDT','PDX','PEO','PGA','PGUM','PHL','PHT','PHX','PIA','PIH','PIR','PKMJ','PLN','PMD','PNC','PNE','POU','PRB','PRC','PSC','PSG','PSP','PTV','PUB','PUC','PUW','PVF','PVU','RAP','RBG','RBL','RCE','RDD','RDM','REO','RFD','RIC','RID','RIF','RIL','RIV','RJAA','RKD','RKS','RMN','RNO','RNT','ROA','ROW','RRT','RST','RSW','RTS','RVF','RYN','RYY','RZR','S21','S25','S33','S39','S52','S97','SAA','SAC','SAD','SAF','SAN','SAT','SAV','SAW','SBA','SBD','SBP','SBS','SC3','SCK','SDL','SDP','SDY','SEZ','SFF','SFM','SFO','SGF','SGS','SGT','SGU','SHR','SHV','SIK','SIT','SIY','SJC','SJS','SJT','SKX','SLC','SLE','SLI','SMF','SMN','SMX','SNA','SNP','SNS','SNY','SOP','SPB','SPF','SPI','SPS','SRQ','SSF','STP','STS','SUA','SUE','SUN','SVC','SVH','SWI','SXQ','SZT','T31','T82','TAL','TCM','TIW','TIX','TKX','TLH','TME','TMK','TOA','TOL','TOP','TRI','TRK','TRL','TRM','TUL','TUS','TVC','TVL','TVR','TWF','TWM','TXK','TYS','U10','U42','UAO','UBW','UGN','UHPP','UKI','UNI','UNV','UOX','UVA','VCT','VDI','VDZ','VEL','VGT','VIH','VKS','VNC','VNY','VQQ','VUO','WDR','WHP','WJF','WRG','WVI','WWD','WYS','X21','X60','XBP','XWA','Y51','YAK','YKM','YKN');


SELECT airports.Dep_Airport_ID, airports.Facility_Type, runway.Dep_Airport_ID
FROM airports
LEFT JOIN runway ON airports.Dep_Airport_ID = runway.Dep_Airport_ID;

SELECT airports.Dep_Airport_ID, airports.Facility_Type, runway.Width, runway.Surface_Type_Condition, runway.WBC_Single, runway.WBC_Dual, runway.WBC_Two_Dual, runway.WBC_Tandem_Two_Dual 
FROM airports
LEFT JOIN runway ON airports.Dep_Airport_ID = runway.Dep_Airport_ID;

SELECT airports.Dep_Airport_ID, airports.Facility_Type, runway.Width, runway.Surface_Type_Condition, runway.WBC_Single, runway.WBC_Dual, runway.WBC_Two_Dual, runway.WBC_Tandem_Two_Dual 
FROM airports
INNER JOIN runway ON airports.Dep_Airport_ID = runway.Dep_Airport_ID;
 
 
 
 
SELECT * FROM runway
RIGHT JOIN runway_counts ON ;
 