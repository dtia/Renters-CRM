class User < ActiveRecord::Base
  attr_accessible :credit_score, :fbid, :firstname, :lastname, :phone, :role, :ssn
  has_many :properties
  has_many :applications
  has_many :properties, :through => :applications
  has_many :payments
  validates :role, :email, :presence => true
  
  def self.create(role, firstname, lastname, email, phone, ssn)
    if User.where("email = ?", email).empty?
      user = User.new
      user.role = role
      user.firstname = firstname
      user.lastname = lastname
      user.email = email
      user.phone = phone
      user.ssn = ssn
      user.save
    end
  end
end
