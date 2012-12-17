class AddUnitNumberToProperties < ActiveRecord::Migration
  def change
    add_column :properties, :unit, :integer
  end
end
