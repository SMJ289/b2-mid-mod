class AmusementPark < ApplicationRecord
  has_many :rides

  def average_thrill_rating
    rides.average(:thrill_rating).to_f
  end
end
