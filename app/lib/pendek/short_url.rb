class Pendek::ShortURL

  DEFAULT_LENGTH = 6

  def self.print
    length = Rails.configuration.x.short_url_length.to_i || DEFAULT_LENGTH
    return length.times.map do
      [(0..9), ('A'..'Z'), ('a'..'z')].map do |chars|
          chars.to_a
        end.flatten.sample
      end.join
  end

end