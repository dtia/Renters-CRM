class CreateEducations < ActiveRecord::Migration
  def change
    create_table :educations do |t|
      t.integer :user_id
      t.string :school
      t.string :degree
      t.date :date
      t.string :major

      t.timestamps
    end
  end
end
