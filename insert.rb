require 'mongo'

# insert_one
db[:zips].insert_one(_id: '100', city: 'city01',
                     loc: [-76.05922700000001, 39.564894],
                     pop: 4678, state: 'MD')

# find count (for insert_one)
p db[:zips].find(city: 'city01').count

# insert_many
db[:zips].insert_many([
  { _id: '200', city: 'city02', loc: [-74.05922700000001, 37.564894], pop: 2000,
    state: 'CA' },
  { _id: '201', city: 'city03', loc: [-75.05922700000001, 35.564894], pop: 3000,
    state: 'CA' }
])

# find count (for insert_many)
p db[:zips].find(city: 'city02').count
p db[:zips].find(city: 'city03').count
