class CreateVisits < ActiveRecord::Migration
  def change
    create_table :visits do |t|
      t.references :user
      t.references :shortened_url

      t.timestamps
    end
    add_index :visits, :user_id
    add_index :visits, :shortened_url_id
  end
end
