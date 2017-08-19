class UrlSerializer < ActiveModel::Serializer
  attributes :full, :short, :created_at, :sessions
  has_many :sessions
end
