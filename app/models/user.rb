class User
  include Mongoid::Document
  include Mongoid::Timestamps
  include ActiveModel::SecurePassword
  
  #field :email, type: String
  field :user_name, type: String
  field :password_digest, type: String
  has_secure_password
  
  has_and_belongs_to_many :challenges
  
  
end
