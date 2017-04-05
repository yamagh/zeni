class CreateLogs < ActiveRecord::Migration[5.0]
  def change
    create_table :logs do |t|
      t.references :user, foreign_key: true
      t.datetime :logged_at
      t.decimal :ammount
      t.boolean :is_expence
      t.references :account, foreign_key: true
      t.references :sub_category, foreign_key: true
      t.references :store, foreign_key: true
      t.string :item
      t.string :memo

      t.timestamps
    end
  end
end
