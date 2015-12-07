class Shoutout
  include Mongoid::Document
  include Mongoid::Timestamps
  field :content, type: String
  
  belongs_to :user, :inverse_of => :shoutouts
  
end
