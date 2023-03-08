#!/usr/bin/env python
# coding: utf-8

# In[2]:


import pandas as pd
import numpy as np
import altair as alt


# In[3]:


df = pd.read_excel(r'/Users/saiaishwaryasakamuri/Desktop/Final Data/final_runway_info.xlsx')
print(df)


# In[4]:


df_new=df[['Loc Id', 'Runway Id','Schedule']]


# In[5]:


df_new


# In[6]:


count=df_new['Loc Id'].value_counts(ascending=True)


# In[7]:


count


# In[8]:


df_new.to_csv('df_new.csv', header=False, index=False)


# In[9]:


result = df_new.groupby(['Loc Id','Runway Id']).count()
print(result)


# In[19]:


result1=df_new.groupby(['Loc Id','Runway Id'])['Loc Id'].aggregate('count')
print(result1)


# In[25]:


result1['BET']


# In[26]:


result2=df_new.groupby(['Loc Id'])['Runway Id'].nunique() 
print(result2)


# In[32]:


result2


# In[36]:


datafinal = pd.DataFrame(result2)


# In[39]:


datafinal


# In[40]:


grouped_df = result2.reset_index()
print(grouped_df)
print(type(grouped_df))


# In[41]:


grouped_df


# In[43]:


grouped_df['Loc Id']


# In[44]:


grouped_df.to_csv('Runwaycount.csv', header=True, index=False)


# In[ ]:




