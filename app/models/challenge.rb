class Challenge
  include Mongoid::Document
  field :name, type: String
  field :description, type: String
  field :restaurant, type: String
  field :address, type: String
  field :city, type: String
  field :state, type: String
  field :zip, type: String
  field :difficulty, type: Integer
  
  validates :name, presence: true
  validates :description, presence: true, length: { maximum: 200 }
  validates :restaurant, presence: true
  validates :address, presence: true
  validates :city, presence: true
  validates :state, presence: true
  #validates :zip, presence: true
  validates_format_of :zip, with: /\A\d{5}-\d{4}|\A\d{5}\z/, message: "Please enter a valid zip code", allows_blank: false
  validates :difficulty, presence: true, numericality: { only_integer: true, greater_than_equal_to: 0 }

end
