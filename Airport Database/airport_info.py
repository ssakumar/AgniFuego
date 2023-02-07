#!/usr/bin/env python
# coding: utf-8

# In[1]:


from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.common.keys import Keys
import time
import pandas as pd

browser = webdriver.Chrome()

wb= pd.read_excel(r'/Users/saiaishwaryasakamuri/Desktop/DAEN DB/airport.xlsx',sheet_name='Sheet1')

airport_nos=(wb['DepartureAirport'].tolist())

xpath = '''/html/body/form/center/table/tbody/tr/td[1]/table/tbody/tr[2]/td[2]/input'''


#Input xpaths

variation_xpath= '''/html/body/table[5]/tbody/tr/td[1]/table[1]/tbody/tr[4]/td[2]'''

location_xpath='''/html/body/table[5]/tbody/tr/td[1]/table[1]/tbody/tr[2]/td[2]'''

elevation_xpath='''/html/body/table[5]/tbody/tr/td[1]/table[1]/tbody/tr[3]/td[2]'''

from_city_xpath= '''/html/body/table[5]/tbody/tr/td[1]/table[1]/tbody/tr[5]/td[2] '''

time_zone_xpath= '''/html/body/table[5]/tbody/tr/td[1]/table[1]/tbody/tr[6]/td[2]'''

zipcode_xpath='''/html/body/table[5]/tbody/tr/td[1]/table[1]/tbody/tr[7]/td[2]'''

airport_use_xpath='''/html/body/table[5]/tbody/tr/td[1]/table[2]/tbody/tr[1]/td[2]'''

activation_date_xpath= '''/html/body/table[5]/tbody/tr/td[1]/table[2]/tbody/tr[2]/td[2]'''

control_tower_xpath= '''/html/body/table[5]/tbody/tr/td[1]/table[2]/tbody/tr[3]/td[2]'''

artcc_xpath ='''/html/body/table[5]/tbody/tr/td[1]/table[2]/tbody/tr[4]/td[2]'''

fss_xpath= '''/html/body/table[5]/tbody/tr/td[1]/table[2]/tbody/tr[5]/td[2]'''

attendance_xpath= '''/html/body/table[5]/tbody/tr/td[1]/table[2]/tbody/tr[7]/td[2]'''

fueltype_xpath= '''/html/body/table[5]/tbody/tr/td[1]/table[6]/tbody/tr[1]/td[2]'''

parking1_xpath='''/html/body/table[5]/tbody/tr/td[1]/table[5]/tbody/tr[2]/td[2]'''

parking2_xpath='''/html/body/table[5]/tbody/tr/td[1]/table[6]/tbody/tr[2]/td[2]'''


#Variables

variation=[]
location=[]
elevation=[]
airport_numbers = []
from_city=[]
time_zone=[]
zipcode=[]
airport_use=[]
activation_date=[]
control_tower=[]
artcc=[]
fss=[]
attendance=[]
fueltype=[]
parking1=[]
parking2=[]


print("Total: :", len(airport_nos))

count = 0

for airport_no in airport_nos[0:5]:

    count +=1
    print("Current :", count)

    airport_numbers +=  [airport_no]

    browser.get('http://airnav.com/airports/')

    text_input = browser.find_element(By.XPATH, xpath)

    text_input.send_keys(airport_no)

    text_input.send_keys(Keys.RETURN)

    time.sleep(3)

    try:
        time.sleep(1)
        location += [browser.find_element(By.XPATH, location_xpath).text]
    except Exception as e:
        location += ['nan'] 
        print('nan')

    try:
        time.sleep(1)
        elevation += [browser.find_element(By.XPATH, elevation_xpath).text]
    except Exception as e:
        print('nan')
        elevation += ['nan']
    
    try:
        time.sleep(1)
        variation += [browser.find_element(By.XPATH, variation_xpath).text]
    except Exception as e:
        variation += ['nan'] 
        print('nan')
        
    try:
        time.sleep(1)
        from_city += [browser.find_element(By.XPATH, from_city_xpath).text]
    except Exception as e:
        print('nan')
        from_city += ['nan']
    
    try:
        time.sleep(1)
        time_zone += [browser.find_element(By.XPATH, time_zone_xpath).text]
    except Exception as e:
        time_zone += ['nan'] 
        print('nan')
    
    try:
        time.sleep(1)
        zipcode += [browser.find_element(By.XPATH, zipcode_xpath).text]
    except Exception as e:
        print('nan')
        zipcode += ['nan']
    
    try:
        time.sleep(1)
        airport_use += [browser.find_element(By.XPATH, airport_use_xpath).text]
    except Exception as e:
        airport_use += ['nan'] 
        print('nan')
    
    try:
        time.sleep(1)
        activation_date += [browser.find_element(By.XPATH, activation_date_xpath).text]
    except Exception as e:
        print('nan')
        activation_date += ['nan']

    try:
        time.sleep(1)
        control_tower += [browser.find_element(By.XPATH, control_tower_xpath).text]
    except Exception as e:
        control_tower += ['nan'] 
        print('nan')
        
    try:
        time.sleep(1)
        artcc += [browser.find_element(By.XPATH, artcc_xpath).text]
    except Exception as e:
        print('nan')
        artcc += ['nan']
        
    try:
        time.sleep(1)
        fss += [browser.find_element(By.XPATH, fss_xpath).text]
    except Exception as e:
        fss += ['nan'] 
        print('nan')

    try:
        time.sleep(1)
        attendance+= [browser.find_element(By.XPATH, attendance_xpath).text]
    except Exception as e:
        print('nan')
        attendance += ['nan']
    
    try:
        time.sleep(1)
        fueltype += [browser.find_element(By.XPATH, fueltype_xpath).text]
    except Exception as e:
        fueltype += ['nan'] 
        print('nan')
    
    try:
        time.sleep(1)
        parking1+= [browser.find_element(By.XPATH, parking1_xpath).text]
    except Exception as e:
        print('nan')
        parking1 += ['nan']
    
    try:
        time.sleep(1)
        parking2 += [browser.find_element(By.XPATH, parking2_xpath).text]
    except Exception as e:
        parking2 += ['nan'] 
        print('nan')
   
     
        
    
        
airport_dat = pd.DataFrame(list(zip(airport_numbers, location, elevation,variation,from_city,time_zone,zipcode,airport_use,activation_date,control_tower,artcc,fss,attendance,fueltype,parking1,parking2)), 
                        columns=['airport_numbers','location','elevation','variation','from_city','time_zone','zipcode','airport_use','activation_date','control_tower','artcc','fss','attendance','fueltype','parking1','parking2']) 

# export data as csv file
airport_dat.to_csv('airport_dat.csv', index=False)

print("Done")


# In[ ]:




