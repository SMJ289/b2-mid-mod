require "rails_helper"

RSpec.describe "When I visit an amusement parks show page" do
  it "I can see the name and price for admission" do
      park_1 = AmusementPark.create(name: "Hershey Park", admission_price: "$50.00")

      visit "/amusement_parks/#{park_1.id}"

      expect(page).to have_content(park_1.name)
      expect(page).to have_content("Admissions: #{park_1.admission_price}")
  end

  it "I can see the names of all the rides that are at that theme park in alphabetical order" do
    park_1 = AmusementPark.create(name: "Hershey Park", admission_price: "$50.00")
    ride_2 = park_1.rides.create(name: "Storm Runner", thrill_rating: 8)
    ride_1 = park_1.rides.create(name: "Lightning Racer", thrill_rating: 5)
    ride_3 = park_1.rides.create(name: "The Great Bear", thrill_rating: 2)

    visit "/amusement_parks/#{park_1.id}"
    expect(page.all('li')[0]).to have_content(ride_1.name)
    expect(page.all('li')[1]).to have_content(ride_2.name)
    expect(page.all('li')[2]).to have_content(ride_3.name)
  end

  it "I can see the average thrill rating of all the rides at that park" do
    park_1 = AmusementPark.create(name: "Hershey Park", admission_price: "$50.00")
    park_1.rides.create(name: "Storm Runner", thrill_rating: 8)
    park_1.rides.create(name: "Lightning Racer", thrill_rating: 5)
    park_1.rides.create(name: "The Great Bear", thrill_rating: 2)

    visit "/amusement_parks/#{park_1.id}"
    expect(page).to have_content("Average Thrill Rating of Rides: #{park_1.average_thrill_rating}/10")
  end
end
