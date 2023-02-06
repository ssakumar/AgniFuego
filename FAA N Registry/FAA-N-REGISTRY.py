#!/usr/bin/env python
# coding: utf-8

# In[17]:


from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.common.keys import Keys
import time
import pandas as pd
import openpyxl as xl

browser = webdriver.Chrome()

wb= pd.read_excel(r'/Users/saiaishwaryasakamuri/Desktop/DAEN DB/Tailnumfinal1.xlsx',sheet_name='Sheet1')

flight_nos=(wb['Tail_Numbers'].tolist())

xpath = '''//*[@id="input-error"]'''


model = []
type_aircraft = []
manufacturing_name = []
exp_date = []
eng_type = []
flight_numbers = []
reg_owner_name = []
serial_number=[]
pending_number_change=[]
date_change_authorized=[]
mfr_year=[]
type_registration=[]
status=[]
certificate_issue_date=[]
dealer=[]
mode_S_code_8=[]
mode_S_code_16=[]
fractional_owner=[]
street=[]
city=[]
county=[]
country=[]
state=[]
zip_code=[]
type_certificate_data_sheet=[]
engine_manufacturer=[]
engine_model=[]
awdate=[]
type_certificate_holder=[]
classification=[]
category=[]
exception_code=[]

print("Total: :", len(flight_nos))

count = 0

for flight_no in flight_nos:

    count +=1
    print("Current :", count)

    flight_numbers +=  [flight_no]

    browser.get('https://registry.faa.gov/aircraftinquiry/Search/NNumberInquiry')

    text_input = browser.find_element(By.XPATH, xpath)

    text_input.send_keys(flight_no)

    # Keys.Return does "Enter functionality
    text_input.send_keys(Keys.RETURN)

    time.sleep(3)

    all_td_elements = browser.find_elements(By.TAG_NAME,'td')

    set_reg_owner_name = False
    set_eng_type = False
    set_exp_date = False
    set_manufacturing_name = False
    set_type_aircraft = False
    set_model = False
    set_serial_number=False
    set_pending_number_change=False
    set_date_change_authorized=False
    set_mfr_year=False
    set_type_registration=False
    set_status=False
    set_certificate_issue_date = False
    set_dealer=False
    set_mode_S_code_8 = False
    set_mode_S_code_16 = False
    set_fractional_owner = False
    set_street = False
    set_city = False
    set_county = False
    set_country = False
    set_state = False
    set_zip_code = False
    set_type_certificate_data_sheet = False
    set_engine_manufacturer = False
    set_engine_model = False
    set_awdate = False
    set_type_certificate_holder = False
    set_classification = False
    set_category = False
    set_exception_code = False
    


    for ele in all_td_elements:

        if ele.get_attribute('data-label') == "Name" and not set_reg_owner_name :
            reg_owner_name += [ele.text]
            set_reg_owner_name = True
        
        if ele.get_attribute('data-label') == "Engine Type" and not set_eng_type:
            eng_type += [ele.text]
            set_eng_type = True
        
        if ele.get_attribute('data-label') == "Expiration Date" and not set_exp_date:
            exp_date += [ele.text]
            set_exp_date = True

        if ele.get_attribute('data-label') == "Manufacturer Name" and not set_manufacturing_name:
            manufacturing_name += [ele.text]
            set_manufacturing_name = True

        if ele.get_attribute('data-label') == "Aircraft Type" and not set_type_aircraft:
            type_aircraft += [ele.text]
            set_type_aircraft = True

        if ele.get_attribute('data-label') == "Model" and not set_model:
            model += [ele.text]
            set_model = True
            
        if ele.get_attribute('data-label') == "Serial Number" and not set_serial_number:
            serial_number += [ele.text]
            set_serial_number = True
            
        if ele.get_attribute('data-label') == "Pending Number Change" and not set_pending_number_change:
            pending_number_change += [ele.text]
            set_pending_number_change = True
        
        if ele.get_attribute('data-label') == "Date Change Authorized" and not set_date_change_authorized:
            date_change_authorized += [ele.text]
            set_date_change_authorized = True
            
        
        if ele.get_attribute('data-label') == "Mfr Year" and not set_mfr_year:
            mfr_year += [ele.text]
            set_mfr_year = True
        
        if ele.get_attribute('data-label') == "Type Registration" and not set_type_registration:
            type_registration += [ele.text]
            set_type_registration = True
        
        if ele.get_attribute('data-label') == "Status" and not set_status:
            status += [ele.text]
            set_status = True
         
        if ele.get_attribute('data-label') == "Certificate Issue Date" and not set_certificate_issue_date:
            certificate_issue_date += [ele.text]
            set_certificate_issue_date = True
        
        if ele.get_attribute('data-label') == "Dealer" and not set_dealer:
            dealer += [ele.text]
            set_dealer = True
        
        if ele.get_attribute('data-label') == "Mode S Code (Base 8 / oct)" and not set_mode_S_code_8:
            mode_S_code_8 += [ele.text]
            set_mode_S_code_8 = True 
        
        
        if ele.get_attribute('data-label') == "Mode S Code (Base 16 / Hex)" and not set_mode_S_code_16:
            mode_S_code_16 += [ele.text]
            set_mode_S_code_16 = True
            
        if ele.get_attribute('data-label') == "Fractional Owner" and not set_fractional_owner:
            fractional_owner += [ele.text]
            set_fractional_owner = True
        
        if ele.get_attribute('data-label') == "Street" and not set_street:
            street += [ele.text]
            set_street = True
            
        if ele.get_attribute('data-label') == "City" and not set_city:
            city += [ele.text]
            set_city = True
        
        if ele.get_attribute('data-label') == "County" and not set_county:
            county += [ele.text]
            set_county = True
            
        if ele.get_attribute('data-label') == "Country" and not set_country:
            country += [ele.text]
            set_country = True
        
        if ele.get_attribute('data-label') == "State" and not set_state:
            state += [ele.text]
            set_state = True
            
        if ele.get_attribute('data-label') == "Zip Code" and not set_zip_code:
            zip_code += [ele.text]
            set_zip_code = True
        
        if ele.get_attribute('data-label') == "Type Certificate Data Sheet" and not set_type_certificate_data_sheet:
            type_certificate_data_sheet += [ele.text]
            set_type_certificate_data_sheet = True
        
        if ele.get_attribute('data-label') == "Engine Manufacturer" and not set_engine_manufacturer:
            engine_manufacturer += [ele.text]
            set_engine_manufacturer = True
        
        if ele.get_attribute('data-label') == "Engine Model" and not set_engine_model:
            engine_model += [ele.text]
            set_engine_model = True
        
        if ele.get_attribute('data-label') == "A/W Date" and not set_awdate:
            awdate += [ele.text]
            set_awdate = True
        
        if ele.get_attribute('data-label') == "Type Certificate Holder" and not set_type_certificate_holder:
            type_certificate_holder += [ele.text]
            set_type_certificate_holder = True
        
        if ele.get_attribute('data-label') == "Classification" and not set_classification:
            classification += [ele.text]
            set_classification = True
        
        if ele.get_attribute('data-label') == "Category" and not set_category:
            category += [ele.text]
            set_category = True
        
        
        if ele.get_attribute('data-label') == "Exception Code" and not set_exception_code:
            exception_code += [ele.text]
            set_exception_code = True 

    if not set_model:
        model += ['null']
    
    if not set_type_aircraft:
        type_aircraft += ['null']
    
    if not set_manufacturing_name:
        manufacturing_name += ['null']
    
    if not set_exp_date:
        exp_date += ['null']
    
    if not set_eng_type:
        eng_type += ['null']
    
    if not set_reg_owner_name:
        reg_owner_name += ['null']
     
    if not set_serial_number:
        serial_number += ['null']
        
    if not set_pending_number_change:
        pending_number_change += ['null']
        
    if not set_date_change_authorized:
        date_change_authorized += ['null']
    
    if not set_mfr_year:
        mfr_year += ['null']
    
    if not set_type_registration:
        type_registration += ['null']
        
    if not set_status:
        status+= ['null']
    
    if not set_certificate_issue_date:
        certificate_issue_date += ['null']
    
    if not set_dealer:
        dealer += ['null']
    
    if not set_mode_S_code_8:
        mode_S_code_8  += ['null']
    
    if not set_mode_S_code_16:
        mode_S_code_16 += ['null']
    
    if not set_fractional_owner:
        fractional_owner  += ['null']
    
    if not set_street:
        street += ['null']
    
    if not set_city:
        city += ['null']
    
    if not set_county:
        county += ['null']
    
    if not set_country:
        country += ['null']
    
    if not set_state:
        state += ['null']
    
    if not set_zip_code:
        zip_code += ['null']
    
    if not set_type_certificate_data_sheet:
        type_certificate_data_sheet += ['null']
    
    if not set_engine_manufacturer:
        engine_manufacturer += ['null']
    
    if not set_engine_model:
        engine_model += ['null']
    
    if not set_awdate:
        awdate += ['null']
    
    if not set_type_certificate_holder:
        type_certificate_holder += ['null']
    
    if not set_classification:
        classification += ['null']
    
    if not set_category:
        category += ['null']
    
    if not set_exception_code:
        exception_code += ['null']
    


flight_dat = pd.DataFrame(list(zip(flight_numbers, reg_owner_name , model, type_aircraft, manufacturing_name, exp_date, eng_type, date_change_authorized,  type_registration,dealer,mode_S_code_16,fractional_owner,street,city,county,country,state,zip_code,type_certificate_data_sheet,engine_manufacturer,engine_model,awdate,type_certificate_holder,classification,category,exception_code,status,serial_number,pending_number_change,certificate_issue_date,mfr_year,mode_S_code_8)), 
                        columns=['flight_numbers','reg_owner_name','model', 'type_aircraft', 'manufacturing_name', 'exp_date', 'eng_type','date_change_authorized','type_registration','dealer','mode_S_code_16','fractional_owner','street','city','county','country','state','zip_code','type_certificate_data_sheet','engine_manufacturer','engine_model','awdate','type_certificate_holder','classification','category','exception_code','status','serial_number','pending_number_change','certificate_issue_date','mfr_year','mode_S_code_8']) 

# export data as csv file
flight_dat.to_csv('flight_dat.csv', index=False)


# In[ ]:




