require 'rails_helper'

describe AmusementPark do
  describe "relationships" do
    it {should have_many :rides}
  end
end
