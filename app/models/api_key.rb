class ApiKey
  include Mongoid::Document
  before_create :get_access_token
  #field :access_token, type: String
  ###HOLD OFF FOR NOW
  
  
  
  private
  
  def get_access_token
    begin
       self.access_token = SecureRandom.hex
    end while self.class.exists?(access_token: :access_token)
  end
end
