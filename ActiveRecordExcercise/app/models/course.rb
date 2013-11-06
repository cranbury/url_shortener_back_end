class Course < ActiveRecord::Base
  # belongs_to :prerequisite
#   belongs_to :students
#   attr_accessible :instructor, :name
  has_many(
    :students,
    :class_name => "User",
    :foreign_key => :user_id,
    :primary_key => :id
    )

    belongs_to(
    :instructor,
    :class_name => "User",
    :foreign_key => :user_id,
    :primary_key => :id
      )
end

