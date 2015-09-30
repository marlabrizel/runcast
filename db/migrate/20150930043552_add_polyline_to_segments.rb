class AddPolylineToSegments < ActiveRecord::Migration
  def change
    add_column :segments, :polyline, :text
    add_column :segments, :end_lat, :decimal
    add_column :segments, :end_long, :decimal
  end
end
