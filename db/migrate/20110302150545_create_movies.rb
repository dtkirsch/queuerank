class CreateMovies < ActiveRecord::Migration
  def self.up
    create_table :movies do |t|
      t.string :title
      t.integer :nominated_by_user_id
      t.string :url
      t.time :watched_on
      t.time :created_at

      t.timestamps
    end
  end

  def self.down
    drop_table :movies
  end
end
