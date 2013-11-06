class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.references :course

      t.timestamps
    end
    add_index :users, :course_id
  end
end
