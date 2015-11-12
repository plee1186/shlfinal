class User
  include Mongoid::Document
  field :email, type: String
  field :fname, type: String
  field :lname, type: String
  field :gender, type: String
  field :yob, type: Integer
  field :tos, type: Mongoid::Boolean
  #validates :tos, :inclusion => {:in => [true]}
  has_and_belongs_to_many :challenges
  
 # validates :email, presence: true
 # validates :yob, presence: true, numericality: { only_integer: true, less_than_equal_to: 2000 }
end
