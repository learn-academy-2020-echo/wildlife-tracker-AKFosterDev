class CreateSightings < ActiveRecord::Migration[6.0]
  def change
    create_table :sightings do |t|
      t.datetime :data
      t.decimal :lat
      t.decimal :lng
      t.integer :animal_id

      t.timestamps
    end
  end
end
