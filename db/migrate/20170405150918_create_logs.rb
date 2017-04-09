class CreateLogs < ActiveRecord::Migration[5.0]
  def change
    create_table :logs do |t|
      t.references :user,         foreign_key: true, null: false
      t.datetime   :logged_at,                       null: false, default: DateTime.now
      t.decimal    :ammount,                         null: false, default: 0
      t.boolean    :is_expence,                      null: false, default: true
      t.references :account,      foreign_key: true, null: false
      t.references :sub_category, foreign_key: true, null: false
      t.references :store,        foreign_key: true
      t.string     :item,                            null: false
      t.string     :memo

      t.timestamps
    end
  end
end
