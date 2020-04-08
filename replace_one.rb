require 'mongo'
require 'pry-byebug'

# Define log level to INFO (default DEBUG)
Mongo::Logger.logger.level = ::Logger::INFO

# Connect to localhosts
db = Mongo::Client.new('mongodb://localhost:27017')

# use database test
db = db.use('test')

# Delete id 100 if already exist
#db[:zips].find(:_id => '100').delete_one()

# first-add a new city (:city => "citytemp")
db[:zips].insert_one(:_id => "100", :city => "citytemp", :loc => [ -76.05922700000001, 39.564894 ], :pop => 4678, :state => "MD" )


# check the insertion
db[:zips].find(:city => 'citytemp').first

# replace city name from 'citytemp' to 'city02'
db[:zips].find(:_id => "100").replace_one(:_id => "100", :city => "city02", :loc => [ -78.22, 36.22 ], :pop => 2000, :state => "MD" ) 


# check to see if 'city02' is there using _id - YES
db[:zips].find(:_id => "100").to_a
