class ChangeSsnAndPhoneToString < ActiveRecord::Migration
  def up
    change_table :users do |t|
       t.change :ssn, :string
    end
  end

  def down
    change_table :users do |t|
       t.change :ssn, :integer
    end    
  end
end
