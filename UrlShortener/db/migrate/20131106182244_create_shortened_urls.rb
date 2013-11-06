class CreateShortenedUrls < ActiveRecord::Migration
  def change
    create_table :shortened_urls do |t|
      t.string :long_url
      t.string :short_url
      t.references :user

      t.timestamps
    end
    add_index :shortened_urls, :user_id
  end
end
