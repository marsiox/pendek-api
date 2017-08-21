class UrlSerializer < ActiveModel::Serializer
  attributes :id, :full_url, :short_url
  type 'url'

  def id
    object.short
  end

  def short_url
    Rails.configuration.x.app_base_url + object.short
  end

  def full_url
    object.full
  end

end
