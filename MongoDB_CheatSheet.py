#MongoDB Crash Course Notes
#https://www.youtube.com/watch?v=ofme2o29ngU&ab_channel=WebDevSimplified

mongosh           #opens shell
show dbs          #shows databse
use appdb         #select database you watn to use (can change appdb to whatever)
show collections  #view collections
db.dropDatabse()  #delet database
cls               #clears screen (stays on active work)
exit              #exits you out of terminal


#Adding Data To Databse
use appdb
db.users.insertOne({ name: "John"}  #insert one record
db.users.insertOne({ name: "Sally", age: 16, address: {street: "987 North St"}, hobbies: ["running"] }) #can nest which is hard in SQL
db.users.insertMany([{ name: "Billi", age: 54, hobbies: ["cooking", "weight lifting"], address: { street: "321 North St"}}, 
                     { name: "Tommy", age: 46, hobbies: ["reading", "gaming"], address: { street: "456 North St"}}])  #inserts many records
db.users.find()   # show everything in database
                   
#How To Read Data From Database  
db.users.find().limit(2)  #show 2 things in databse
db.users.find().sort({name: 1}).limit(2)  #ascending order limit by 2 [A-Z]
db.users.find().sort({name: -1}).limit(2) #descending order linit by 2 [Z-A]
