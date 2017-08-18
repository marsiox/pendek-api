class UrlSerializer < ActiveModel::Serializer
  attributes :id, :full, :short, :created_at
end
