class AddCityAndStateToSegments < ActiveRecord::Migration
  def change
    add_column :segments, :city, :string
    add_column :segments, :state, :string
  end
end
