class Session < ApplicationRecord
  belongs_to :url
  belongs_to :referer
end
