class AddUserIdToApplicationData < ActiveRecord::Migration
  def change
    add_column :application_data, :userid, :string
  end
end
