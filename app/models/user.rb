class User < ApplicationRecord
    has_many :comments
    has_many :posts
    has_secure_password
    validates :username, uniqueness: { case_sensitive: false }
    # has_many :messages
    # has_many :remarks
end
