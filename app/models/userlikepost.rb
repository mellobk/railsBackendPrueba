class Userlikepost < ApplicationRecord

    belongs_to :user
    belongs_to :postp

    validates :user_id, presence: true
    validates :postp_id, presence: true

end
