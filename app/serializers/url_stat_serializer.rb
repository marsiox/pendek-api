class UrlStatSerializer < ActiveModel::Serializer
  type 'stats'

  attributes :id, :full_url, :stats

  def stats
    last_sessions = Session.where(url: object).order(created_at: :desc).limit(25)

    {
      all_visits: Session.where(url: object).count,
      by_http_referer: by_referer,
      last_visits: last_sessions
    }
  end

  def by_referer
    groupped = Session.where(url: object).order(created_at: :desc).limit(100).group_by(&:http_referer)
    groupped.map { |k, v| { http_referer: k, visits: v.count } }
  end

  def full_url
    object.full
  end

  def id
    object.short
  end

end
