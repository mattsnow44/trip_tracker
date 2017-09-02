trip = Trip.find(1)

20.times do
  trip.locations.create(name: Faker::LordOfTheRings.location)
end

puts 'Locations seeded for first Trip!'
