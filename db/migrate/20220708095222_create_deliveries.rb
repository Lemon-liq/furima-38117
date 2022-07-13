class CreateDeliveries < ActiveRecord::Migration[6.0]
  def change
    create_table :deliveries do |t|
      t.string :zip_code,           null: false
      t.integer :prefecture_id,     null: false
      t.string :city,               null: false
      t.string :address_line1,      null: false
      t.string :address_line2,      null: false
      t.string :tel,                null: false
      t.references :buy,            null: false, foreign_key: true
      t.timestamps
    end
  end
end
