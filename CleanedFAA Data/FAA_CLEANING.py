#!/usr/bin/env python
# coding: utf-8

# In[34]:


import pandas as pd
import numpy as np
import altair as alt


# In[2]:


#Reading the file

df=pd.read_csv("/Users/saiaishwaryasakamuri/Desktop/DAEN DB/FAA N Registry/flight_dat.csv")


# In[3]:


#Preview of the file
df


# In[4]:


df.isnull()


# In[7]:


df1=df.dropna()


# In[8]:


df1


# In[9]:



# Get all Column Header Labels as List
for column_headers in df.columns: 
    print(column_headers)


# In[10]:


df2 = df1[['flight_numbers','reg_owner_name','model','type_aircraft','manufacturing_name','state','category','mfr_year']]


# In[11]:


df2


# In[21]:


df2.dtypes


# In[44]:



headerList = ['flight_numbers', 'reg_owner_name', 'model','type_aircraft','manufacturing_name','state','category','mfr_year']
df2.to_csv("flight_data.csv", header=headerList, index=False)


# In[45]:


df_new=pd.read_csv("/Users/saiaishwaryasakamuri/Desktop/DAEN DB/FAA N Registry/flight_data.csv")


# In[46]:


df_new


# In[47]:


df_new["mfr_year"] = df_new["mfr_year"].astype(str).astype(int)
  
print(df_new.dtypes)


# In[ ]:


df_new['Current_Year'] = 2023


# In[50]:


df_new


# In[51]:


df_new.dtypes


# In[53]:


df_new['Aircraft_Age'] = df_new.Current_Year - df_new.mfr_year


# In[54]:


df_new


# In[55]:


del df_new['mfr_year']
del df_new['Current_Year']


# In[56]:


df_new


# In[61]:


df_new.loc[df_new['Aircraft_Age'] == 2023]


# In[62]:


df_new


# In[66]:


df_new.loc[(df_new.Aircraft_Age == 2023), 'Aircraft_Age'] = 0


# In[67]:


df_new


# In[73]:


df_new.loc[df_new['Aircraft_Age'] == 2023]


# In[75]:



headerList = ['flight_numbers', 'reg_owner_name', 'model','type_aircraft','manufacturing_name','state','category','Aircraft_Age']
df_new.to_csv("faa_data.csv", header=headerList, index=False)


# In[76]:


df_new


# In[78]:


df_new['Aircraft_Age'] = np.where((df_new.Aircraft_Age == 0), 'No information', df_new.Aircraft_Age)
print(df_new)


# In[79]:


df_new.loc[df_new['Aircraft_Age'] == "No information"]


# In[80]:



headerList = ['flight_numbers', 'reg_owner_name', 'model','type_aircraft','manufacturing_name','state','category','Aircraft_Age']
df_new.to_csv("faa_final_data.csv", header=headerList, index=False)


# In[ ]:




