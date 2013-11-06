require 'SecureRandom'

class ShortenedUrl < ActiveRecord::Base
  belongs_to(:submitter,
  class_name: "User",
  foreign_key: :user_id,
  primary_key: :id)

  attr_accessible :long_url, :short_url
  validates :short_url, uniqueness: true

  def self.random_code
    random = ''
    loop do
      random = SecureRandom::urlsafe_base64[0..15]
      break if find_by_short(random).empty?
    end

    random
  end

  def self.create_for_user_and_long_url!(user, long_url)
    shortened = ShortenedUrl.new
    # puts "made it this far"
 #    puts user
 #    puts user.id
    shortened.user_id = user.id
    shortened.short_url = ShortenedUrl.random_code
    shortened.long_url = long_url
    shortened.save
  end

  def self.find_by_short(short_url)
    ShortenedUrl.find_by_sql ("SELECT * FROM shortened_urls
    WHERE short_url = '#{short_url}'")
  end

  def num_clicks
    Visit.count(:conditions => "shortened_url_id = #{self.id}" )
  end

  def num_uniques
    Visit.count(:group => :user_id, :conditions => "shortened_url_id = #{self.id}",
    :distinct => true).size

    #REFACTOR! ^^^
  end

  def num_recent_uniques
    Visit.where(:shortened_url_id => self.id,
    created_at: 10.minutes.ago..Time.now).count(:user_id, distinct: true)

    #REFACTOR! ^^^
  end

end
