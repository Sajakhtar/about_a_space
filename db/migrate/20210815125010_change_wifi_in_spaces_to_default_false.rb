class ChangeWifiInSpacesToDefaultFalse < ActiveRecord::Migration[6.1]
  def change
    change_column :spaces, :wifi, :boolean, default: false
  end
end
