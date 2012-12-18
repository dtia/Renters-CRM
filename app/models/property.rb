class Property < ActiveRecord::Base
  attr_accessible :avail_date, :baths, :beds, :city, :deposit, :has_parking, :lat, :lng, :price, :state, :street, :unit
  belongs_to :user
  has_many :applications
  has_many :users, :through => :applications
  validates :street, :city, :state, :user_id, :price, :presence => true
  
  def self.create(beds, baths, street, unit, city, state, zip, avail_date, price, deposit, has_parking, user_id)
    if Property.where("street = ? and unit = ? and city = ? and state = ?", street, unit, city, state).empty?
      prop = Property.new
      prop.beds = beds
      prop.baths = baths
      prop.street = street
      prop.unit = unit
      prop.city = city
      prop.state = state
      prop.zip = zip
      prop.avail_date = avail_date
      prop.price = price
      prop.deposit = deposit
      prop.has_parking = has_parking
      prop.user_id = user_id
      prop.save
    end
  
  end
  
  def self.get_properties(user_id)
    return Property.where("user_id = ?", user_id)
  end
  
  def self.get_matches(city, state, date)
    puts city + ' ' + state
    if !date.empty?
      return Property.where("city = ? and state = ? and avail_date = ?", city, state, date)
    else
      return Property.where("city = ? and state = ?", city, state)
    end
  end
end
