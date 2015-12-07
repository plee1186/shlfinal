class Api::V1::ChallengeSerializer < Api::V1::BaseSerializer
  attributes :content, :created_at
  
  belongs_to :user
end