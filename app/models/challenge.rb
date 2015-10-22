class Challenge
  include Mongoid::Document
  field :name, type: String
  field :description, type: String
  field :restaurant, type: String
  field :address, type: String
  field :city, type: String
  field :state, type: String
  field :zip, type: Integer
end
