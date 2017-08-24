class UrlStatSerializer < ActiveModel::Serializer
  type 'stats'

  attributes :id, :full_url, :stats

  def stats
    last_sessions = object.sessions
      .joins(:referer)
      .order(created_at: :desc)
      .limit(25)
      .select(:id, :user_agent, :ip_address, "referers.url as http_referer", "sessions.created_at")

    {
      all_visits: object.visits.to_i,
      by_http_referer: by_referer,
      last_visits: last_sessions
    }
  end

  def by_referer
    object.referers.map { |r| { http_referer: r.url, visits: Stat.where(referer: r, url: object).sum(:visits).to_i } }
  end

  def full_url
    object.full
  end

  def id
    object.short
  end

end
