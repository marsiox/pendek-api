class Url < ApplicationRecord
  has_many :sessions

  validates :full, presence: true
  validates :short, presence: true
end
