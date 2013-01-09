class FixFbid < ActiveRecord::Migration
  def up
    rename_column :users, :fbid, :uid
  end

  def down
  end
end
