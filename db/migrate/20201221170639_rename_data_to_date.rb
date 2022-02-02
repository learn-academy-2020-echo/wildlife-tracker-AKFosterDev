class RenameDataToDate < ActiveRecord::Migration[6.0]
  def change
    rename_column :sightings, :data, :date
  end
end
