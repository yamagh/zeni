class CreateStores < ActiveRecord::Migration[5.0]
  def change
    create_table :stores do |t|
      t.references :user,        null: false, foreign_key: true
      t.string     :name,        null: false
      t.integer    :tel
      t.string     :address
      t.boolean    :is_disabled, null: false, default: false
      t.integer    :order,       null: false, default: 0

      t.timestamps
    end
  end
end
