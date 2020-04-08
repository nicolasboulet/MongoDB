require 'mongo'
require 'pry-byebug'

# Define log level to INFO (default DEBUG)
Mongo::Logger.logger.level = ::Logger::INFO

# Connect to localhosts
db = Mongo::Client.new('mongodb://localhost:27017')

# use database test
db = db.use('test')

# when upsert is true that means add if don't exist

db[:zips].find(:city => "ODENVILLE1").count
db[:zips].find(:city => "ODENVILLE2").count
db[:zips].find(:city => "ODENVILLE1").update_one({:$set => {:city => "ODENVILLE2"}}, :upsert => true)
db[:zips].find(:city => "ODENVILLE1").count
db[:zips].find(:city => "ODENVILLE2").count
