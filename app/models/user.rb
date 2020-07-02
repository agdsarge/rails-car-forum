class User < ApplicationRecord
    has_many :comments
    has_many :posts
    # has_many :messages
    # has_many :remarks
end
