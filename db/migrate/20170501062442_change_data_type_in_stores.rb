class ChangeDataTypeInStores < ActiveRecord::Migration[5.0]
  def change
    change_column :stores, :tel, :string
  end
end
