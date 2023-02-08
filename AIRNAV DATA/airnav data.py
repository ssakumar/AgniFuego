#!/usr/bin/env python
# coding: utf-8

# In[13]:


from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.common.keys import Keys
import time
import pandas as pd

browser = webdriver.Chrome()

wb= pd.read_excel(r'/Users/yelur/Downloads/airport.xlsx',sheet_name='Sheet1')

airport_nos=(wb['DepartureAirport'].tolist())

xpath = '''/html/body/form/center/table/tbody/tr/td[1]/table/tbody/tr[2]/td[2]/input'''


#Input xpaths

near_by_airport1_xpath='''/html/body/table[5]/tbody/tr/td[1]/a[10]'''
near_by_airport2_xpath='''/html/body/table[5]/tbody/tr/td[1]/a[11]'''
near_by_airport3_xpath='''/html/body/table[5]/tbody/tr/td[1]/a[12]'''


#Variables

airport_numbers=[]
near_by_airport1=[]
near_by_airport2=[]
near_by_airport3=[]




print("Total: :", len(airport_nos))

count = 0

    
for airport_no in airport_nos[620:661]:
    try:
        count +=1
        print("Current :", count)

        airport_numbers +=  [airport_no]

        browser.get('http://airnav.com/airports/')

        text_input = browser.find_element(By.XPATH, xpath)

        text_input.send_keys(airport_no)

        text_input.send_keys(Keys.RETURN)

        time.sleep(2)

        try:
            time.sleep(1)
            near_by_airport1 += [browser.find_element(By.XPATH, near_by_airport1_xpath).text]
        except Exception as e:
            near_by_airport1 += ['nan'] 
            print('nan')
     
        try:
            time.sleep(1)
            near_by_airport2 += [browser.find_element(By.XPATH, near_by_airport2_xpath).text]
        except Exception as e:
            print('nan')
            near_by_airport2 += ['nan']
    
    
        try:
            time.sleep(1)
            near_by_airport3 += [browser.find_element(By.XPATH, near_by_airport3_xpath).text]
        except Exception as e:
            near_by_airport3 += ['nan'] 
            print('nan')
    except Exception as e:
        print('error:',airport_no)
        
airport_dat = pd.DataFrame(list(zip(airport_numbers,near_by_airport1,near_by_airport2,near_by_airport3)), 
                        columns=['airport_numbers','near_by_airport1','near_by_airport2','near_by_airport3']) 

# export data as csv file
airport_dat.to_csv('airport_dat12.csv', index=False)

print("Done")


# In[ ]:





# In[ ]:





# In[ ]:




