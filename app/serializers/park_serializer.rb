class ParkSerializer
  include JSONAPI::Serializer
  
  attributes :name, :description, :entrance_fee_foreign, :entrance_fee_local, 
             :location, :highlights, :image_url
  
  has_many :activities
  has_many :accommodations
end