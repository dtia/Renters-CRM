class Application < ActiveRecord::Base
  attr_accessible :property_id, :start_date, :user_id
  belongs_to :user
  belongs_to :property
  belongs_to :application_data
  
  def self.create_application(property_id, start_date, application_data_id, uid)
    app_data = ApplicationData.where("userid = ?", uid).first
    
    if !app_data.nil?
      app = Application.new
      app.user_id = uid
      app.property_id = property_id
      app.start_date = start_date
      app.application_data_id = application_data_id
      app.save
    end
    app
  end
end
