require 'mongo'
require 'pry-byebug'

# Define log level to INFO (default DEBUG)
Mongo::Logger.logger.level = ::Logger::INFO

# Connect to localhosts
db = Mongo::Client.new('mongodb://localhost:27017')

# use database test
db = db.use('test')

# update_many (many document update in one query)

db[:zips].find(:state => 'MD').count
db[:zips].find(:state => 'MD').update_many(:$set => {:state => 'XX'}) 
db[:zips].find(:state => 'MD').count
db[:zips].find(:state => 'XX').count
db[:zips].find(:state => 'XX').update_many(:$set => {:state => 'MD'}) 
db[:zips].find(:state => 'XX').count
db[:zips].find(:state => 'MD').count
