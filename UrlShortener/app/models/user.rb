

class User < ActiveRecord::Base
  attr_accessible :email

  has_many(:submitted_urls,
  class_name: "ShortenedUrl",
  foreign_key: :short_url,
  primary_key: :id)

  validates :email, uniqueness: true
end

