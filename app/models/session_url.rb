class SessionUrl < ApplicationRecord
  belongs_to :session
  belongs_to :url
end
