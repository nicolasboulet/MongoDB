require 'mongo'
require 'pry-byebug'

# Define log level to INFO (default DEBUG)
Mongo::Logger.logger.level = ::Logger::INFO

# Connect to localhosts
db = Mongo::Client.new('mongodb://localhost:27017')

# use database test
db = db.use('test')

# delete_many document in one time
db[:zips].find(:state => 'MD' ).delete_many()
