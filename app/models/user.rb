class User < ApplicationRecord
    has_many :comments
    has_many :posts
    has_secure_password
    validates :username, uniqueness: { case_sensitive: false }
    has_many :messages
    has_many :friends, through: :messages
    has_many :remarks
    before_save :avatar_check

    def avatar_check
        unless self.avatar
            self.avatar = '../assets/default-avatar.png'
        end
    end

end
