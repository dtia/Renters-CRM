class ApplicationData < ActiveRecord::Base
  attr_accessible :bankruptcy, :convicted, :convicted_reason, :curr_city, :curr_date_in, :curr_date_out, :curr_landlord, :curr_landlord_phone, :curr_reason_leave, :curr_state, :curr_street_address, :curr_zip, :emerg_address, :emerg_name, :emerg_phone, :emerg_relationship, :employer, :employer_address, :employer_city, :employer_end, :employer_start, :employer_state, :employer_zip, :evicted, :evicted_reason, :occupation, :pets, :prev_city, :prev_date_in, :prev_date_out, :prev_landlord, :prev_landlord_phone, :prev_reason_leave, :prev_state, :prev_street_address, :prev_zip, :ref_address, :ref_name, :ref_phone, :ref_relationship, :refuse_rent, :salary, :supervisor, :supervisor_phone, :userid, :vehicle_license_state, :vehicle_make_model, :vehicle_year
  has_many :applications
  
  def self.create_application_data(params)
    app = Application.where("userid = ?", current_user.id).first
    if app.nil?
      app = Application.new
      app.userid = current_user.id
      app.curr_street_address = params[:curr_address]
      app.curr_city = params[:curr_city]
      app.curr_state = params[:curr_state]
      app.curr_zip = params[:curr_zip]
      app.curr_date_in = params[:curr_date_in]
      app.curr_date_out = params[:curr_date_out]
      app.curr_landlord = params[:curr_landlord]
      app.curr_landlord_phone = params[:curr_landlord_phone]
      app.curr_reason_leave = params[:curr_reason_leave]
      app.prev_street_address = params[:prev_address]
      app.prev_city = params[:prev_city]
      app.prev_state = params[:prev_state]
      app.prev_zip = params[:prev_zip]
      app.prev_date_in = params[:prev_date_in]
      app.prev_date_out = params[:prev_date_out]
      app.prev_landlord = params[:prev_landlord]
      app.prev_landlord_phone = params[:prev_landlord_phone]
      app.prev_reason_leave = params[:prev_reason_leave]
      app.occupation = params[:occupation]
      app.employer = params[:employer]
      app.salary = params[:salary]
      app.supervisor = params[:supervisor]
      app.employer_start = params[:employer_start]
      app.employer_end = params[:employer_end]
      app.employer_address = params[:emp_address]
      app.employer_city = params[:emp_city]
      app.employer_state = params[:emp_state]
      app.employer_zip = params[:emp_zip]
      app.emerg_name = params[:emerg_name]
      app.emerg_address = params[:emerg_address]
      app.emerg_phone = params[:emerg_phone]
      app.emerg_relationship = params[:emerg_relationship]
      app.ref_name = params[:ref_name]
      app.ref_address = params[:ref_address]
      app.ref_phone = params[:ref_phone]
      app.ref_relationship = params[:ref_relationship]
      app.pets = params[:pets]
      app.bankruptcy = params[:bankruptcy]
      app.refuse_rent = params[:refuse_rent]
      app.evicted = params[:evicted]
      app.evicted_reason = params[:evicted_reason]
      app.convicted = params[:convicted]
      app.convicted_reason = params[:convicted_reason]
      app.vehicle_make_model = params[:vehicle_make_model]
      app.vehicle_year = params[:vehicle_year]
      app.vehicle_license_state = params[:vehicle_license_state]    
      app.save
    end
    app
  end  
end
