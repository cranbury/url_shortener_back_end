class Visit < ActiveRecord::Base
  belongs_to(:visitors,
   class_name: "User",
   foreign_key: :user_id,
   primary_key: :id)

  belongs_to(:visited_urls,
  class_name: "ShortenedUrl",
  foreign_key: :shortened_url_id,
  primary_key: :id)
  # attr_accessible :title, :body




  def self.record_visit!(user, shortened_url)
    v = self.create_visit(user, shortened_url)
    v.save
  end

  def self.create_visit(user, shortened_url)
    this_visit = Visit.new
    this_visit.user_id = user.id
    this_visit.shortened_url_id = shortened_url.id
    this_visit
  end




end
