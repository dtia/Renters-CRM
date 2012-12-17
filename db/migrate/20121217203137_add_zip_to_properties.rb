class AddZipToProperties < ActiveRecord::Migration
  def change
    add_column :properties, :zip, :integer
  end
end
