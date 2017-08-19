class Url < ApplicationRecord
  validates :full, presence: true
  validates :short, presence: true
end
