require 'mongo'
require 'pry-byebug'

# Define log level to INFO (default DEBUG)
Mongo::Logger.logger.level = ::Logger::INFO

# Connect to localhosts
db = Mongo::Client.new('mongodb://localhost:27017')

# use database test
db = db.use('test')

############################
binding.pry

#Paging Limit
db[:zips].find.limit(3).each { |r| pp r}

#Limit and Skip
db[:zips].find.skip(3).limit(3).each { |r| pp r}

# Sorting
#ASCENDING
db[:zips].find.limit(3).sort({:city => 1 }).each { |r| pp r}

#DESCENDING
db[:zips].find.limit(3).sort({:city => -1 }).each { |r| pp r}

# Find By lt and gt operator
puts 'Find By lt and gt operator'
db[:zips].find(:city => {:$lt =>  'D'}).limit(2).to_a.each { |r| pp r}

db[:zips].find(:city => {:$lt => 'P', :$gt => 'B'}).limit(3).to_a.each{ |r| pp r}

# Find by REGEX
puts 'Find by REGEX'
puts ''
db[:zips].find(:city => {:$regex => 'X'}).limit(5).each {|r| pp r}

# Find by REGEX
db[:zips].find(:city => {:$regex => 'X$'}).limit(5).each {|r| pp r}

# Find by REGEX
db[:zips].find(:city => {:$regex => '^X'}).projection({:_id => false}).limit(5).to_a.each {|r| pp r}

# Find by REGEX
db[:zips].find(:city => {:$regex => '^[A-E]'}).projection({:_id => false}).limit(5).to_a.each {|r| pp r}

# Find by if exist a key
puts 'Find bu $exists'
puts ''
db[:zips].find(:city => {:$exists => true}).projection({:_id => false}).limit(3).to_a.each {|r| pp r}

# Find by $not
puts 'Find by $not'
puts ''
db[:zips].find(:pop => {'$not' => {'$gt' => 9500}}).projection({_id:false}).limit(20).to_a.each {|r| pp r}

#Find by $type see BSON types https://docs.mongodb.com/manual/reference/bson-types/
puts 'Find by $type'
puts ''
db[:zips].find({ :state => {:$type => 2}}).first
