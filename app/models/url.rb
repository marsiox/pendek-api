class Url < ApplicationRecord
  has_many :sessions

  validates :full, presence: true
  validates :full, url: true
  validates :short, presence: true
end
