class Enrollment < ActiveRecord::Base
  # belongs_to :course
   attr_accessible :name

   belongs_to(
     :courses,
     :class_name => "Course",
     :foreign_key => :course_id,
     :primary_key => :id
     )

   belongs_to(
     :users,
     :class_name => "User",
     :foreign_key => :user_id,
     :primary_key => :id
     )
end
