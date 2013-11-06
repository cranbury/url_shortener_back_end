class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :name
      t.references :prerequisite
      t.references :students
      t.string :instructor

      t.timestamps
    end
    add_index :courses, :prerequisite_id
    add_index :courses, :students_id
  end
end
