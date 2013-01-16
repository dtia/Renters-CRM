class Education < ActiveRecord::Base
  attr_accessible :date, :degree, :major, :school, :user_id
  
  def self.insert_educations(edu_arr, user_id)
    edu_arr.each do |edu|
      education = Education.new
      education.school = edu.school_name
      education.major = edu.field_of_study
      education.degree = edu.degree
      education.date = Date.new(edu.end_date.year.to_i) if !edu.end_date.blank?
      education.user_id = user_id
      education.save
    end
  end
end
