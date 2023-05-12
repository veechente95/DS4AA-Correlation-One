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
db.users.find().sort({name: 1}).limit(2)  #sort ascending order limit by 2 [A-Z]
db.users.find().sort({name: -1}).limit(2) #sort descending order linit by 2 [Z-A]
db.users.find().sort({age: 1, name: 1}) #sort multipoe fields (age & name)
db.users.find().skip(1).  #skip 1st entry

#Queries
db.users.find({name: "Sally"})  #returns query where object is "Sally"
db.users.find({name: "Sally"},{address: 0}) #retuns multiple queries (NOTE - 0 will return NOTHING for that field)
db.users.find({name: "Sally"},{address: 1}) #retuns multiple queries (NOTE - 1 will return EVERYTHING for that field)

#Complex Queries
db.users.find({ name: { $eq: "Sally"}}) #returns query where name Equals "Sally"
db.users.find({ name: { $ne: "Sally"}}) #returns query where name does NOT EQUAL "Sally"
db.users.find({ age: { $gt: 13}}) #returns query where age > 13
db.users.find({ age: { $gte: 46}})  #returns query where age is >= 46

                   

