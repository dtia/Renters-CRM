class CreatePositions < ActiveRecord::Migration
  def change
    create_table :positions do |t|
      t.integer :user_id
      t.string :title
      t.string :company
      t.date :startdate
      t.date :enddate
      t.boolean :current

      t.timestamps
    end
  end
end
