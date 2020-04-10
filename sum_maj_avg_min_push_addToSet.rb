# $sum
db[:zips].find.aggregate([{ :$group=>{:_id=>'$state', :population=>{:$sum=>'$pop'}}},:$limit=>5]).each {|r| pp r}

# $avg
db[:zips].find.aggregate([{ :$group=>{ :_id=>'$state', :ave_population=>{:$avg=>'$pop'}}},{:$limit=>5}]).each {|r| pp r}

# $max
db[:zips].find().aggregate([{:$group=>{ :_id=>'$state', :max_zip=>{:$max=>'$pop'}}}, {:$limit=>5}]).each {|r| pp r}

# $min
db[:zips].find().aggregate([{:$group=>{ :_id=>'$state', :min_zip=>{:$min=>'$pop'}}}, {:$limit=>5}]).each {|r| pp r}

# $push
db[:zips].find().aggregate(
  [{:$group=>{ :_id=>{:city=>'$city',  
  :state=>'$state'},
  :zips=>{:$push=>'$_id'}}},    
  {:$limit=>15}]).each {|r| pp r}

# $addToSet

db[:zips].find.aggregate([ {:$group=>{:_id=>0, :zips=>{:$push=>"$state"}}}]).first  

db[:zips].find.aggregate([ {:$group=>{:_id=>0, :zips=>{:$addToSet=>"$state"}}}]).first
