class Property < ActiveRecord::Base
  attr_accessible :avail_date, :baths, :beds, :city, :deposit, :has_parking, :lat, :lng, :price, :state, :street
  belongs_to :user
  has_many :applications
  has_many :users, :through => applications
end
