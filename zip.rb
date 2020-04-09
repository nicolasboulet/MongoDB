class Zip
  # into models
  # method for access to client in console 
  def self.mongo_client
    Mongoid::Clients.default
  end

  # method for access to rips collection
  def self.collection
    self.mongo_client['zips']
  end
end
