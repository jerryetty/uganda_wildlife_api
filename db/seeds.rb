# db/seeds.rb
# Create Parks based on Uganda Wildlife Authority data
parks_data = [
  {
    name: "Bwindi Impenetrable National Park",
    description: "Home to nearly half of the world's remaining mountain gorillas",
    entrance_fee_foreign: 40.00,
    entrance_fee_local: 20000.00,
    location: "Southwestern Uganda",
    highlights: "Mountain Gorilla Tracking, Bird Watching, Nature Walks",
    image_url: "/bwindi-gorillas.png"
  },
  {
    name: "Murchison Falls National Park",
    description: "Uganda's largest national park with the spectacular Murchison Falls",
    entrance_fee_foreign: 40.00,
    entrance_fee_local: 20000.00,
    location: "Northwestern Uganda",
    highlights: "Game Drives, Boat Safaris, Murchison Falls, Big Five",
    image_url: "/murchison-falls-waterfall-with-wildlife-safari.png"
  }
]

parks_data.each do |park_data|
  Park.find_or_create_by(name: park_data[:name]) do |park|
    park.assign_attributes(park_data)
  end
end

# Create Activities
activities_data = [
  {
    park_name: "Bwindi Impenetrable National Park",
    name: "Gorilla Tracking",
    description: "Track mountain gorillas in their natural habitat",
    price_foreign: 700.00,
    price_local: 250000.00,
    duration_hours: 8,
    max_participants: 8
  },
  {
    park_name: "Murchison Falls National Park",
    name: "Game Drive",
    description: "Wildlife viewing in the savanna",
    price_foreign: 30.00,
    price_local: 15000.00,
    duration_hours: 4,
    max_participants: 20
  }
]

activities_data.each do |activity_data|
  park = Park.find_by(name: activity_data[:park_name])
  next unless park
  
  Activity.find_or_create_by(park: park, name: activity_data[:name]) do |activity|
    activity.assign_attributes(activity_data.except(:park_name))
  end
end