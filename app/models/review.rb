class Review < ActiveRecord::Base
  attr_accessible :review, :reviewer_id, :user_id
  belongs_to :user
  
  # def self.find_reviewers_for_user(uid)
  #   User.select("u.*").
  #       where("u.id = ?", uid).
  #       joins("as u inner join reviews as r on u.id = r.reviewer_id")
  # end
end
