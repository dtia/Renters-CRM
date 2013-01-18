class AddCityValueToProperties < ActiveRecord::Migration
  def change
    add_column :properties, :cityval, :string
  end
end
