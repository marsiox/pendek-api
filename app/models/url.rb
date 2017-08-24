require_dependency Rails.root.join('app/validators/url_validator.rb')

class Url < ApplicationRecord
  has_many :sessions
  has_many :stats
  has_many :referers, through: :stats

  validates :full, presence: true, url: true, uniqueness: true
  validates :short, presence: true
end
