class CreateApplications < ActiveRecord::Migration
  def change
    create_table :applications do |t|
      t.integer :user_id
      t.integer :property_id
      t.date :start_date

      t.timestamps
    end
  end
end
