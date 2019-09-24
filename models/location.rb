class Location < ActiveRecord::Base
  belongs_to :user

  validates :longitude, :latitude, presence: true
end