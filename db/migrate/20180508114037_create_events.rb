class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.belongs_to :user, index: true
      t.string :name
      t.string :event_detail
      t.datetime :event_start_date
      t.datetime :event_end_date
      t.timestamps
    end
  end
end
