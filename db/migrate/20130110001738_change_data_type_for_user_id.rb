class ChangeDataTypeForUserId < ActiveRecord::Migration
  def up
    change_table :application_data do |t|
      t.change :userid, :string
    end
  end

  def down
    change_table :application_data do |t|
      t.change :userid, :integer
    end
  end
end
