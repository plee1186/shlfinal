class Api::V1::SessionSerializer < Api::V1::BaseSerializer
  attributes :id, :user_name, :token

  def token
    object.authentication_token
  end
end