class Referer < ApplicationRecord
  has_many :sessions
  has_many :stats
end
