require 'rails_helper'

describe Ride do
  describe "relationships" do
    it {should belong_to :amusement_park}
  end
end
