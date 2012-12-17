class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.integer :user_id
      t.string :name
      t.string :cc_type
      t.integer :cc_num
      t.date :exp_date
      t.integer :sec_code

      t.timestamps
    end
  end
end
