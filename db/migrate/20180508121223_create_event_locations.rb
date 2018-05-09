class CreateEventLocations < ActiveRecord::Migration[5.2]
  def change
    create_table :event_locations do |t|
      t.belongs_to :event, index: { unique: true }, foreign_key: true
      t.belongs_to :location, index: true
      t.string :description
      t.timestamps
    end
  end
end
