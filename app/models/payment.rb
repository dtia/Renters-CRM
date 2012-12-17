class Payment < ActiveRecord::Base
  attr_accessible :cc_num, :cc_type, :exp_date, :name, :sec_code, :user_id
  belongs_to :user
end
