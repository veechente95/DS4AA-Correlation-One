import pandas as pd   #import poandas
df = pd.read_csv("FileName.csv")   #read dataframe
df["column"].drop_dupicates()  # drops duplicates
df["column"].drop_duplicates().to_list()  #shows all categories w/o/ duplicates in list form
df["column"].min() #gets min value
df["column"].max() #gets max value
df["column"].str.lower()  #makes all str lowercase
df["column"].drop_duplicates().str.count("-").head(10)  #counts num of "-", without duplicates, limit to 10 rows
