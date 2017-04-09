class CreateSubCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :sub_categories do |t|
      t.references :category,    null: false, foreign_key: true
      t.string     :name,        null: false
      t.boolean    :is_disabled, null: false, default: false
      t.integer    :order,       null: false, default: 0

      t.timestamps
    end
  end
end
