--MongoDB Crash Course Notes
--https://www.youtube.com/watch?v=ofme2o29ngU&ab_channel=WebDevSimplified

mongosh           #opens shell
show dbs          #shows databse
use appdb         #select database you watn to use (can change appdb to whatever)
show collections  #view collections
db.dropDatabse()  #delete database
cls               #clears screen (stays on active work)
exit              #exits you out of terminal


--Adding Data To Databse
use appdb
db.users.insertOne({ name: "John"})  #insert one record
db.users.insertOne({ name: "Sally", age: 16, address: {street: "987 North St"}, hobbies: ["running"] }) #can nest which is hard in SQL
db.users.insertMany([{ name: "Billi", age: 54, hobbies: ["cooking", "weight lifting"], address: { street: "321 North St"}}, 
                     { name: "Tommy", age: 46, hobbies: ["reading", "gaming"], address: { street: "456 North St"}}])  #inserts many records
db.users.find()   # show everything in database
                   
--How To Read Data From Database  
db.users.find().limit(2)  #show 2 things in databse
db.users.find().sort({name: 1}).limit(2)  #sort ascending order limit by 2 [A-Z]
db.users.find().sort({name: -1}).limit(2) #sort descending order linit by 2 [Z-A]
db.users.find().sort({age: 1, name: 1}) #sort multipoe fields (age & name)
db.users.find().skip(1).  #skip 1st entry

--Queries
db.users.find({name: "Sally"})  #returns query where object is "Sally"
db.users.find({name: "Sally"},{address: 0}) #retuns multiple queries (NOTE - 0 will return NOTHING for that field)
db.users.find({name: "Sally"},{address: 1}) #retuns multiple queries (NOTE - 1 will return EVERYTHING for that field)

--Complex Queries
db.users.find({ name: { $eq: "Sally"}}) #returns query where name Equals "Sally"
db.users.find({ name: { $ne: "Sally"}}) #returns query where name does NOT EQUAL "Sally"
db.users.find({ age: { $gt: 13}}) #returns query where age > 13
db.users.find({ age: { $gte: 46}})  #returns query where age is >= 46
db.users.find({ age: { $lte: 46}})  #returns query where age is <= 46
db.users.find({ name: { $in: ["Billi", "Tommy"]}})  #returns query where name is IN "Billi" or "Tommy"                   
db.users.find({ name: { $nin: ["Billi", "Tommy"]}})  #returns query where name is NOT IN "Billi" or "Tommy"
db.users.find({ age: { $exists: true }})  #returns objects that have an age in their field (will return NULL values)
db.users.find({ age: { $exists: false }})  #returns objects that dont have an age in their field (will return NULL values)

--Combining Multiple Complex Queries
db.users.find({ age: { $gte: 20, $lte: 50 }}) #returns query where age is >= 20 AND age is <= 50
db.users.find({ age: { $gte: 20, $lte: 50 }, name: "Tommy"})  #returns query where age is >= 20 AND age <= 50 AND name is "Tommy"
db.users.find({ $and: [{age: 54}, {name: "Billi"}] }) #returns query where age is 54 AND name is "Billi"
db.users.find({ $or: [{age: {$lte: 20}}, {name: "Billi"}] })  #returns query where age <= 20 OR name is "Billi"
db.users.find({ age: { $not: { $lte: 20}}}) #returns query where age is NOT <= 20 (will return NULL values)
db.users.find({$expr: {$gt: ["$debt", "$balance"]}})  #returns object where debt > balance

--Additional Find Methods
db.users.find({ "address.street": "321 North St"})  #finds object with "321 North St"
db.users.findOne({ age: {$lte: 40}})  #find first user with age <= 40
db.users.countDocuments({ age: {$lte: 40}}) #returns count of objects with age <= 40

--Updating Data
db.users.updateOne({age: 54}, { $set: {age: 60}}) #update first user age from 54 to 60
db.users.updateOne({_id: ObjectId("645c0be9aece6fe4a20442bb")}, {$rename: {name: "firstname"}}) #rename first Object Id from "name" to "firstname"
db.users.updateOne({_id: ObjectId("645c0be9aece6fe4a20442bb")}, {$unset: {age: ""}})  #unset completeley removes "age" property from first Obect Id
db.users.updateOne({_id: ObjectId("645c0be9aece6fe4a20442bb")}, {$push: {hobbies: "swimming"}}) #push adds to field (in this case adds "swimming" to hobbies array)
db.users.updateOne({_id: ObjectId("645c0be9aece6fe4a20442bb")}, {$push: {hobbies: "swimming"}}) #pull removes from field (in this case removes "swimming" from hobbies array)
db.users.updateMany({address: {$exists: true}}, {$unset: {address: ""}})  #updates many fields where address exist, and removes address property

--Deleting
db.users.deleteOne({})  #delets first one
db.users.deleteMany({}) #deletes many
                   
