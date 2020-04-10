# include fields
db[:zips].find.aggregate([
  {:$project=>{:_id=>1, :city=>1, :state=>1,:pop=>1 }},
  {:$limit=>5}
]).each {|r| pp r}

# exclude fields
db[:zips].find.aggregate(
  [{:$project=>{ :_id=>0, :state=>1,      
  :pop=>1 }},{:$limit=>5}]).each {|r|    
  pp r}

# alter data
db[:zips].find.aggregate([
  {:$project=>{:_id=>0,
  :state=>{:$toLower=>'$state'},
  :pop=>1 }},{:$limit=>5}]).each {|r|  
   pp r}
