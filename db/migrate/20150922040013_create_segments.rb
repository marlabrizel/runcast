class CreateSegments < ActiveRecord::Migration
  def change
    create_table :segments do |t|
      t.string :name
      t.datetime :date
      t.integer :elapsed_time
      t.decimal :distance
      t.decimal :start_lat
      t.decimal :start_long
      t.integer :strava_id
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
