class ActivitySerializer
  include JSONAPI::Serializer
  
  attributes :name, :description, :price_foreign, :price_local, 
             :duration_hours, :max_participants
  
  belongs_to :park
end
