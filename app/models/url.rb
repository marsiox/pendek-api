class Url < ApplicationRecord
  has_many :sessions

  validates :full, presence: true, url: true, uniqueness: true
  validates :short, presence: true
end
