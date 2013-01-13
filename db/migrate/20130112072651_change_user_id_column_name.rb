class ChangeUserIdColumnName < ActiveRecord::Migration
  def up
    rename_column :application_data, :userid, :user_id
  end

  def down
  end
end
