class AddColumnToApplication < ActiveRecord::Migration
  def change
    add_column :applications, :application_data_id, :integer
  end
end
