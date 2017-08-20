class SessionSerializer < ActiveModel::Serializer
  attributes :user_session_id, :ip_address, :http_referer, :user_agent, :created_at
end
