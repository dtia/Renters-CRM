class ChangeDataTypeForUnit < ActiveRecord::Migration
  def up
    change_table :properties do |t|
      t.change :unit, :string
    end
  end

  def down
    change_table :properties do |t|
      t.change :unit, :integer
    end
  end
end