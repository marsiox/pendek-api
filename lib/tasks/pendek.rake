namespace :pendek do
  desc "Updates monthly stats"

  task update_stats: :environment do

    date_range = (1.day.ago..Time.zone.now)


    set = Session.where(created_at: date_range)
      .select([
        "extract(year from created_at) as year",
        "extract(month from created_at) as month",
        "url_id",
        "referer_id",
        "count(*) as visits"
      ])
      .group('year', 'month', 'url_id', 'referer_id')

    set.each do |group|
      stat_group = Stat.find_or_create_by(year: group.year.to_i, month: group.month.to_i, url_id: group.url_id, referer_id: group.referer_id)
      stat_group.year = group.year.to_i
      stat_group.month = group.month.to_i
      stat_group.url_id = group.url_id
      stat_group.referer_id = group.referer_id
      stat_group.visits = group.visits
      stat_group.save!
    end

  end

end
