# create index
db[:zips].indexes.create_one({ :loc => Mongo::Index::GEO2D })

# 2d sphere index
db[:zips].find(:city => 'BALTIMORE').first

db[:zips].find({:loc => {:'$near' =>[-82.624023,  39.864452]}}).limit(3).each { |r| pp r}

# $maxDistance
db[:zips].find(:loc => {:'$near'  => [-76,39.29],:'$maxDistance' => 1}).count

db[:zips].find(:loc => {:'$near' => [-76,39.29],:'$maxDistance' => 10 }).count

# $maxDistance, $minDistance and $near
db[:zips].find(:loc => {:'$near' => [-76,39.29],:'$minDistance' => 1, :'$maxDistance' => 5}).count
