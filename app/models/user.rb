class User
  include Mongoid::Document
  field :email, type: String
  field :fname, type: String
  field :lname, type: String
  field :gender, type: String
  field :yob, type: Integer
  has_many :challenges
end
