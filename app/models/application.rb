class Application < ActiveRecord::Base
  attr_accessible :property_id, :start_date, :user_id
  belongs_to :user
  belongs_to :property
end
