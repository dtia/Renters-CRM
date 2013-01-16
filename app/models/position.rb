class Position < ActiveRecord::Base
  attr_accessible :company, :current, :enddate, :startdate, :title, :user_id
  
  def self.insert_positions(pos_arr, user_id)
    pos_arr.each do |pos|
      position = Position.new
      position.company = pos.company.name
      position.startdate = Date.new(pos.start_date.year.to_i, pos.start_date.month.to_i, 1) if !pos.start_date.blank?
      position.enddate = Date.new(pos.end_date.year.to_i, pos.end_date.month.to_i, 1) if !pos.end_date.blank?
      position.title = pos.title
      position.user_id = user_id
      position.save
    end
  end
end
