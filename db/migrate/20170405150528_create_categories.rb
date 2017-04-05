class CreateCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :categories do |t|
      t.references :user, foreign_key: true
      t.string :name
      t.boolean :is_disabled
      t.integer :order

      t.timestamps
    end
  end
end
