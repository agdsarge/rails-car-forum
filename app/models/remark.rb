class Remark < ApplicationRecord
    belongs_to :user
    belongs_to :message
    validates :user, presence: true
    validates :message, presence: true
    # validate :user_must_be_message_participant
    #
    #
    # def user_must_be_message_participant
    #     unless :user == :message.user || :user == :message.friend
    #         errors.add(:user, "is not a participant in this conversation")
    #     end
    # end

end
