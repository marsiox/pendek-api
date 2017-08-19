class UrlSerializer < ActiveModel::Serializer
  attributes :full, :short, :created_at
end
