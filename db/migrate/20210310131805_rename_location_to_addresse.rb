class RenameaddressToAddresse < ActiveRecord::Migration[6.0]
  def change
    rename_column :properties, :address, :address
  end
end
