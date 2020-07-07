class Message < ApplicationRecord
    belongs_to :user
    belongs_to :friend, class_name: "User"
    has_many :remarks

end
