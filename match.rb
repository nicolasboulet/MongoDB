# $match
db[:zips].find({:state=>'DE'}).first

db[:zips].find().aggregate([ {:$match=>{:state=>'DE'}}]).first

# $match
db[:zips].find().aggregate([{:$match=>{:state=>'NY'}}, {:$group=>{ :_id=>'$city', :population=>{:$sum=>'$pop'}}}, {:$project=>{ :_id=>0, :city=>'$_id', :population=>1}}, {:$sort=>{ :population=>-1 }},{:$limit=>5}]).each {|r| pp r}
