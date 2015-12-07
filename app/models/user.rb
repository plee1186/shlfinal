class User
  include Mongoid::Document
  include Mongoid::Timestamps
  include ActiveModel::SecurePassword
  before_create :generate_authentication_token
  
  #field :email, type: String
  field :user_name, type: String
  field :password_digest, type: String
  has_secure_password
  field :authentication_token, type: String
  
  has_and_belongs_to_many :challenges
  has_many :shoutouts, :inverse_of => :user
  
  
  private
  
  def generate_authentication_token
    loop do
      self.authentication_token = SecureRandom.base64(64)
      break unless User.find_by(authentication_token: authentication_token)
    end
  end

end
