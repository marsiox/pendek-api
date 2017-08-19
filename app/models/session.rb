class Session < ApplicationRecord
  belongs_to :url

  validates :user_session_id, presence: true
end
