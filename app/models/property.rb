class Property < ActiveRecord::Base
  attr_accessible :avail_date, :baths, :beds, :city, :deposit, :has_parking, :latitude, :longitude, :price, :state, :street, :unit
  belongs_to :user
  has_many :applications
  has_many :users, :through => :applications
  validates :street, :city, :state, :user_id, :price, :presence => true
  geocoded_by :address
  after_validation :geocode
  
  def address
    [street, city, state].compact.join(', ')
  end
  
  def self.create(beds, baths, street, unit, city, state, zip, avail_date, price, deposit, has_parking, fb_id)
    if Property.where("street = ? and unit = ? and city = ? and state = ?", street, unit, city, state).empty?
      # find user id for fb id
      @user = find_user_id(fb_id) # get user id
      if !@user.empty?
        user_id = @user[0].id
              
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
  
  end
  
  def self.get_properties(fbid)
    @user = find_user_id(fbid) # get user id
    if !@user.empty?
      user_id = @user[0].id
      return Property.where("user_id = ?", user_id)
    end
  end
  
  def self.get_matches(city, state, date)
    puts city + ' ' + state
    if !date.nil? && !date.empty?
      return Property.where("city = ? and state = ? and avail_date = ?", city, state, date)
    else
      return Property.where("city = ? and state = ?", city, state)
    end
  end 
  
  private
    def self.find_user_id(fb_id)
      return User.where("fbid = ?", fb_id)
    end
end
