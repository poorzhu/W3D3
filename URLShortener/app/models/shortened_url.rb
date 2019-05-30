class ShortenedUrl < ApplicationRecord

  validates :user_id, presence: true
  validates :long_url, presence: true
  validates :short_url, uniqueness: true

  # ActiveRecord exists?

  def self.create!(user, long_url)
    ShortenedUrl.new(user, long_url, ShortenedUrl.random_code)
  end

  def self.random_code
    short_url = SecureRandom.urlsafe_base64

    while ShortenedUrl.exists?(short_url)
      short_url = SecureRandom.urlsafe_base64
    end

    "https://bit.ly/#{short_url}"
  end



end
