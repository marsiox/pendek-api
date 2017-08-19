class UrlSerializer < ActiveModel::Serializer
  attributes :full, :short, :created_at
  has_many :sessions
end
