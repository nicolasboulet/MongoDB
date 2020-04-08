require 'mongo'
require 'pry-byebug'

# Define log level to INFO (default DEBUG)
Mongo::Logger.logger.level = ::Logger::INFO

# Connect to localhosts
db = Mongo::Client.new('mongodb://localhost:27017')

# use database test
db = db.use('test')

# delete_one

db[:zips].find(:city => 'name2').count
db[:zips].find(:city => 'name2').delete_one()
db[:zips].find(:city => 'name2').count
