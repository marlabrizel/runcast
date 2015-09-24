class AddWeatherColumnsToSegments < ActiveRecord::Migration
  def change
    add_column :segments, :conditions, :string
    add_column :segments, :temperature, :float
    add_column :segments, :humidity, :float
    add_column :segments, :wind_speed, :float
  end
end
