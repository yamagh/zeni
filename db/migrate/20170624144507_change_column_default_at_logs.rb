class ChangeColumnDefaultAtLogs < ActiveRecord::Migration[5.0]
  def change
    change_column_default :logs, :logged_at, -> { 'NOW()' }
    #change_column_default :logs, :logged_at, -> { 'NOW()::timestamp' }
    #change_column_default :logs, :logged_at, from: nil, to: -> { 'CURRENT_TIMESTAMP' }
    #change_column :logs, :logged_at, :datetime, default: -> { 'NOW()' }
    #execute "ALTER TABLE logs ALTER COLUMN logged_at SET DEFAULT now()"
  end
end
