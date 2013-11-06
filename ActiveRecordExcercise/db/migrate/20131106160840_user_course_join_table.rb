class UserCourseJoinTable < ActiveRecord::Migration
  def change
    create_table :enrollments do |t|
      t.references :user
      t.references :course
    end
    add_index :courses, :course_id
    add_index :users, :user_id
  end

end
