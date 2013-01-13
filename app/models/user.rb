class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  attr_accessible :credit_score, :uid, :firstname, :lastname, :phone, :role, :ssn, :provider
  has_many :properties
  has_many :applications
  has_many :properties, :through => :applications
  has_many :payments
  validates :email, :presence => true
  
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
      user
    end
  end
  
  def self.create(firstname, lastname, provider, uid, email, password)
    match_user = User.where("email = ?", email).first
    if match_user.nil?
      user = User.new
      user.firstname = firstname
      user.lastname = lastname
      user.uid = uid
      user.provider = provider
      user.email = email
      user.password = password
      user.save
      user
    else
      match_user.firstname
      match_user.firstname = firstname
      match_user.lastname = lastname
      match_user.uid = uid
      match_user.provider = provider
      match_user.email = email
      match_user.password = password
      match_user.save
      match_user
    end
  end
  
  def self.get_user(id)
    User.where("id = ?", id)
  end
  
  def self.get_users_for_apps(prop_id)
    User.select("u.*").
        where("app.property_id = ?", prop_id).
        joins("as u inner join applications as app on u.id = app.user_id")
  end
  
  def self.find_for_facebook_oauth(auth, signed_in_resource=nil)
    user = User.where(:provider => auth.provider, :uid => auth.uid).first
    unless user
      user = User.create(auth.info.first_name, auth.info.last_name, auth.provider,
                        auth.uid, auth.info.email, Devise.friendly_token[0,20])
    end
    user
  end
  
  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end
end
