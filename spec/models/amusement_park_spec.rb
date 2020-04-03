require 'rails_helper'

describe AmusementPark do
  describe "relationships" do
    it {should have_many :rides}
  end

  describe "instance methods" do
    it ".average_thrill_rating" do
      park_1 = AmusementPark.create(name: "Hershey Park", admission_price: "$50.00")
      park_1.rides.create(name: "Storm Runner", thrill_rating: 8)
      park_1.rides.create(name: "Lightning Racer", thrill_rating: 5)
      park_1.rides.create(name: "The Great Bear", thrill_rating: 2)

      expect(park_1.average_thrill_rating).to eq(5.0)
    end
  end
end
