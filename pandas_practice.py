#Pandas Intro
import pandas as pd   #import poandas
df = pd.read_csv("FileName.csv")   #read dataframe

df.head() #inspect first 5 rows
df.tail() #inspect last 5 rows 
df["column"]  #look at whole column

# By default, pandas assigns a serial number as the index (that's the unnamed column of integers in bold face in the df.head() 
# output above), so setting a custom row index that makes sense for your DataFrame is often a good idea. 
# You can set the index of a DataFrame with the .set_index() method. Here is an example: 
df = df.set_index(["model", "store", "condition"])
df.head()

groups = df.groupby(["column1", "column2"]) # Grouping by
groups["column1"].mean() # You first slice using ["column1"] and then call the mean function on the grouped Series

#Pandas Methods
df["column"].drop_dupicates()  # drops duplicates
df["column"].drop_duplicates().to_list()  #shows all categories w/o/ duplicates in list form
df["column"].min() #gets min value
df["column"].max() #gets max value
df["column"].str.lower()  #makes all str lowercase
df["column"].drop_duplicates().str.count("-").head(10)  #counts num of "-", without duplicates, limit to 10 rows
