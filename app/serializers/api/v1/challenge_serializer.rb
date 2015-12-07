class Api::V1::ChallengeSerializer < Api::V1::BaseSerializer
  attributes :id, :name, :restaurant, :city, :state, :zip, :difficulty
  
  has_and_belongs_to_many :users
end