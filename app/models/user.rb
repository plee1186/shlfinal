class User
  include Mongoid::Document
  field :name, type: String
  field :email, type: String
  field :city, type: String
  field :state, type: String
  field :education, type: String
  field :specialty, type: String
  
  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 }, format: { with: VALID_EMAIL_REGEX }, uniqueness: true
  validates :city, presence: true, length: { maximum: 50 }
  validates :education, presence: true
  validates :specialty, presence: true
  
end
