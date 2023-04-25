#!/usr/bin/env python
# coding: utf-8

# In[3]:


pip install xlrd


# In[4]:


import pandas as pd
import numpy as np


# In[5]:



xls = pd.ExcelFile("/Users/saiaishwaryasakamuri/Desktop/all-airport-data(columns_highlighted).xlsx")
df1 = pd.read_excel(xls, 'Airports')
df2 = pd.read_excel(xls, 'Runways')


# In[6]:


df1


# In[7]:


df2


# In[8]:


data1=df1[['Loc Id','Facility Type','Wind Indicator','ARP Latitude DD','ARP Longitude DD']]
data2=df2[['Loc Id','Runway Id','Surface Type Condition','Edge Light Intensity','WBC Single','WBC Dual','WBC Two Dual','WBC Tandem Two Dual','Base Marking Condition','ICAO Id']]


# In[9]:


data1


# In[10]:


data2


# In[11]:


merge1=pd.merge(data1,data2,on='Loc Id',how='left')


# In[12]:


merge1


# In[13]:


merge1.drop_duplicates()


# In[16]:


df_new = merge1[['Loc Id', 'Runway Id']]


# In[17]:


df_new


# In[18]:


count=df_new['Loc Id'].value_counts(ascending=True)


# In[19]:


count


# In[20]:


result = df_new.groupby(['Loc Id','Runway Id']).count()
print(result)


# In[21]:


result1=df_new.groupby(['Loc Id','Runway Id'])['Loc Id'].aggregate('count')
print(result1)


# In[22]:


result1['BET']


# In[23]:


result2=df_new.groupby(['Loc Id'])['Runway Id'].nunique() 
print(result2)


# In[24]:


result2


# In[25]:


datafinal = pd.DataFrame(result2)


# In[26]:


datafinal


# In[27]:


grouped_df = result2.reset_index()
print(grouped_df)
print(type(grouped_df))


# In[28]:


grouped_df


# In[29]:


grouped_df.to_csv("allairports_runwaycount.csv",header=True)


# In[31]:


final_out=pd.merge(merge1,grouped_df,on='Loc Id',how='left')


# In[32]:


final_out


# In[33]:


final_out.rename(columns = {'Runway Id_x':'Runway Id'}, inplace = True)
final_out.rename(columns = {'#Runwaya':'#Runways'}, inplace = True)


# In[34]:


final_out


# In[35]:


final_out.to_csv("newallairportsaws.csv",header=True)


# In[ ]:




