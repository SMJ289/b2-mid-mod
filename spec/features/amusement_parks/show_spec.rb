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
    ride_1 = park_1.rides.create(name: "Lightning Racer", thrill_rating: 5)
    ride_2 = park_1.rides.create(name: "Storm Runner", thrill_rating: 8)
    ride_3 = park_1.rides.create(name: "The Great Bear", thrill_rating: 2)

    visit "/amusement_parks/#{park_1.id}"
    expect(page).to have_content(ride_1.name)
    expect(page).to have_content(ride_2.name)
    expect(page).to have_content(ride_3.name)
    save_and_open_page
  end
end
