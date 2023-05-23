class RemoveLevelFromMaps < ActiveRecord::Migration[7.0]
  def change
    remove_column :maps, :level
  end
end
