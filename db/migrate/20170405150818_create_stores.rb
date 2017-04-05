class CreateStores < ActiveRecord::Migration[5.0]
  def change
    create_table :stores do |t|
      t.references :user, foreign_key: true
      t.string :name
      t.integer :tel
      t.string :address
      t.boolean :is_disabled
      t.integer :order

      t.timestamps
    end
  end
end
