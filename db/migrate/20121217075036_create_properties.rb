class CreateProperties < ActiveRecord::Migration
  def change
    create_table :properties do |t|
      t.string :street
      t.string :city
      t.string :state
      t.date :avail_date
      t.integer :price
      t.integer :deposit
      t.integer :beds
      t.integer :baths
      t.boolean :has_parking
      t.float :lat
      t.float :lng

      t.timestamps
    end
  end
end
