class UrlSerializer < ActiveModel::Serializer
  attributes :full, :short

  def short
    Rails.configuration.x.app_base_url + object.short
  end
end
