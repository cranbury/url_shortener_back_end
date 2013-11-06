class User < ActiveRecord::Base
  # belongs_to :course
   attr_accessible :name

     has_many :courses, :through => :enrollments, :source => :course


   has_many(
     :enrollments,
     :class_name => "Enrollment",
     :foreign_key => :enrollment_id,
     :primary_key => :id
     )
end
