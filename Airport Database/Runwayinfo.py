#!/usr/bin/env python
# coding: utf-8

# In[1]:


import pandas as pd
import numpy as np


# In[2]:


df=pd.read_csv("/Users/saiaishwaryasakamuri/Desktop/latitude_longitude.csv")
df1=pd.read_csv("/Users/saiaishwaryasakamuri/Desktop/runway_final_data.csv")


# In[3]:


df.head


# In[4]:


df1.head


# In[6]:


data=pd.merge(df,df1,on='Loc Id',how='left')


# In[7]:


data


# In[8]:


data=data.drop(['Unnamed: 0'], axis=1)


# In[9]:


data


# In[10]:


data.to_csv("runways_aws.csv",header=True)


# In[ ]:




