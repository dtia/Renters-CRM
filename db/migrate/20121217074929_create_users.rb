class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :fbid
      t.string :firstname
      t.string :lastname
      t.string :role
      t.string :phone
      t.integer :ssn
      t.integer :credit_score

      t.timestamps
    end
  end
end
