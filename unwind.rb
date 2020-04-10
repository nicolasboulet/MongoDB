# WITHOUT $match
db[:zips].find().aggregate([{:$match=>{:city=>'ELMIRA'}}, {:$group=>{ :_id=>{:city=>'$city',:state=>'$state'}, :zips=>{:$addToSet=>'$_id'}}}]).each {|r| pp r} 

# $unwind
db[:zips].find().aggregate([{:$match=>{:city=>'ELMIRA'}}, {:$group=>{ :_id=>{:city=>'$city',:state=>'$state'},:zips=>{:$addToSet=>'$_id'}}}, {:$unwind=>'$zips'}]).each {|r| pp r}
