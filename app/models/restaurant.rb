class Restaurant
  include Mongoid::Document
  field :name, type: String
  field :address, type: String
  field :city, type: String
  field :state, type: String
  field :zip, type: Integer
  field :challenge, type: String
end
