require 'mongo'

# Define log level to INFO (default DEBUG)
Mongo::Logger.logger.level = ::Logger::INFO

# Connect to localhosts
db = Mongo::Client.new('mongodb://localhost:27017')

# use database test
db = db.use('test')

# find by example
db[:zips].find(city: 'BALTIMORE')

# find first
db[:zips].find.first
db[:zips].find(state: 'MD').first

# distinct
db[:zips].find.distinct(:state)

# find by (hash) - passing parameters
db[:zips].find(city: 'GERMANTOWN').count
db[:zips].find(city: 'GERMANTOWN').first

require 'pp'

pp db[:zips].find(city: 'GERMANTOWN', state: 'NY').first
pp db[:zips].find(city: 'GERMANTOWN', state: 'MD').first

# cursor iterations
db[:zips].find.each { |r| puts r }

db[:zips].find.each { |r| pp r }

# PROJECTIONS -
db[:zips].find({ state: 'MD' }).projection(state: true, _id: false).first
