require 'rails_helper'

RSpec.describe "When I visit the Mechanics index page" do
  it "I can see a header saying 'All Mechanics' and a list of their names and experience" do
    mechanic_1 = Mechanic.create(name: "Steve", years_experience: 10)
    mechanic_2 = Mechanic.create(name: "Mike", years_experience: 20)
    mechanic_3 = Mechanic.create(name: "Meg", years_experience: 15)

    expect(current_path).to eq('/mechanics')
    expect(page).to have_content("All Mechanics")
  end
end
