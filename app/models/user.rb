class User < ActiveRecord::Base
  attr_accessible :credit_score, :fbid, :firstname, :lastname, :phone, :role, :ssn
  has_many :properties
  has_many :applications
  has_many :properties, :through => applications
  has_many :payments
end
