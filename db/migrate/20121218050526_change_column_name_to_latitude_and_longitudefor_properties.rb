class ChangeColumnNameToLatitudeAndLongitudeforProperties < ActiveRecord::Migration
  def up
    rename_column :properties, :lat, :latitude
    rename_column :properties, :lng, :longitude
  end

  def down
  end
end
