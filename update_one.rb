require 'mongo'
require 'pry-byebug'

# Define log level to INFO (default DEBUG)
Mongo::Logger.logger.level = ::Logger::INFO

# Connect to localhosts
db = Mongo::Client.new('mongodb://localhost:27017')

# use database test
db = db.use('test')

# update_on

# find and then update_one
db[:zips].find(:_id => "100").update_one(:$set => {:city => "name2"}) 

# verify the update_one
db[:zips].find(:_id => "100").to_a
