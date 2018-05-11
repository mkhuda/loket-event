class ChangeDatetypeOnEvents < ActiveRecord::Migration[5.2]
  def change
    change_column :events, :event_start_date, :date
    change_column :events, :event_end_date, :date
  end
end
