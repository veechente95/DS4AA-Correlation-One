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
df["column"].drop_duplicates()
df["column"].str.count("-").head(10)  #counts num of "-", limit to 10 rows
df["column"].apply()  #you can send custom functions, pandas will send values from each cell into func. Instead of using for loop, it automatically loops it for us
df["column"].value_counts() #counts values of series (high to low)
df["column"].reset_index()  #reset levels of index back into columns 
df["column"].fillna()  #replace NaN (pandas version of n/a) with any value like “0”

str.contains() #Pass string you want to search and returns True for the cells that contain that string and False for the ones that dont
isin()    #check if something is in another dict, list, tuple, etc


