class UserSerializer < ActiveModel::Serializer
  attributes :username, :first_name, :last_name, :bio, :zip, :email, :avatar, :id

end
