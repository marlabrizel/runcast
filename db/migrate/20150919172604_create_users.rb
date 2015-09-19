class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :provider
      t.string :uid
      t.string :email
      t.string :firstname
      t.string :lastname
      t.string :avatar
      t.string :athlete_type
      t.string :location
      t.string :token

      t.timestamps null: false
    end
  end
end
