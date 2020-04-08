require 'mongo'

# Define log level to INFO (default DEBUG)
Mongo::Logger.logger.level = ::Logger::INFO

# Connect to localhosts
db = Mongo::Client.new('mongodb://localhost:27017')

# use database test
db = db.use('test')

# What is the name of database
print 'Database name is : '
p db.database.name

# What are the collections names
print 'The collections are : '
p db.database.collection_names

# Show first entry
puts 'The first entry is :'
p db[:zips].find.first


