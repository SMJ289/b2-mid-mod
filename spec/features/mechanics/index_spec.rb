require 'rails_helper'

RSpec.describe "When I visit the Mechanics index page" do
  it "I can see a header saying 'All Mechanics' and a list of their names and experience" do
    mechanic_1 = Mechanic.create(name: "Steve", years_experience: 10)
    mechanic_2 = Mechanic.create(name: "Mike", years_experience: 20)
    mechanic_3 = Mechanic.create(name: "Meg", years_experience: 15)
    visit '/mechanics'

    expect(page).to have_content("All Mechanics")
    within "#mechanic-#{mechanic_1.id}-details" do
      expect(page).to have_content("Name: #{mechanic_1.name}")
      expect(page).to have_content("#{mechanic_1.years_experience} years of experience")
    end

    within "#mechanic-#{mechanic_2.id}-details" do
      expect(page).to have_content("Name: #{mechanic_2.name}")
      expect(page).to have_content("#{mechanic_2.years_experience} years of experience")
    end

    within "#mechanic-#{mechanic_3.id}-details" do
      expect(page).to have_content("Name: #{mechanic_3.name}")
      expect(page).to have_content("#{mechanic_3.years_experience} years of experience")
    end
    save_and_open_page
  end
end
