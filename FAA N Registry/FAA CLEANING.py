#!/usr/bin/env python
# coding: utf-8

# In[1]:


import pandas as pd
import numpy as np


# In[2]:


df=pd.read_csv("/Users/saiaishwaryasakamuri/Desktop/Final Data/flight_dat_lg.csv")


# In[3]:


df


# In[4]:


df1=df.rename(columns={"Main Gear Config": "LandingGear"})


# In[5]:


df1.dtypes


# In[6]:


df1.isnull()


# In[7]:


df1["flight_numbers"]


# In[8]:


for column_headers in df1.columns: 
    print(column_headers)


# In[9]:


df2 = df1[['flight_numbers','reg_owner_name','model','type_aircraft','manufacturing_name','state','category','mfr_year','LandingGear']]


# In[10]:


df2


# In[11]:


df2.dtypes


# In[12]:



df2["mfr_year"].isnull()


# In[13]:


df_new = df2.iloc[np.where(df.mfr_year.isnull())]


# In[14]:


df2['mfr_year'] = df2['mfr_year'].fillna(0)


# In[15]:


df2.dtypes


# In[16]:


year_list = df2['mfr_year'].tolist()


# In[17]:


print(year_list)


# In[18]:


df2['mfr_year'] = df2['mfr_year'].replace(['None'], '0')


# In[19]:


years_list = df2['mfr_year'].tolist()
print(years_list)


# In[20]:


df2["mfr_year"] = df2["mfr_year"].astype(str).astype(int)
  
print(df2.dtypes)


# In[21]:


df2['Current_Year'] = 2023


# In[22]:


df2


# In[23]:


df2.dtypes


# In[24]:


df2['Aircraft_Age'] = df2.Current_Year - df2.mfr_year


# In[25]:


df2


# In[26]:


df2.loc[df2['Aircraft_Age'] == 2023]


# In[27]:



df2.loc[(df2.Aircraft_Age == 2023), 'Aircraft_Age'] = 0


# In[28]:



df2.loc[df2['Aircraft_Age'] == 2023]


# In[29]:


del df2['mfr_year']
del df2['Current_Year']


# In[30]:


df2.loc[df2['Aircraft_Age'] == 2023]


# In[31]:


df2['Aircraft_Age'] = np.where((df2.Aircraft_Age == 0), 'No information', df2.Aircraft_Age)
print(df2)


# In[32]:



df2.loc[df2['Aircraft_Age'] == "No information"]


# In[33]:


df2


# In[34]:


headerList = ['flight_numbers', 'reg_owner_name', 'model','type_aircraft','manufacturing_name','state','category','LandingGear','Aircraft_Age']
df2.to_csv("new_faafinal_data.csv", header=headerList, index=False)

