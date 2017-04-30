class AddColumnsToStores < ActiveRecord::Migration[5.0]
  def change
    add_column :stores, :lat, :float, default:0
    add_column :stores, :lng, :float, default:0
  end
end
