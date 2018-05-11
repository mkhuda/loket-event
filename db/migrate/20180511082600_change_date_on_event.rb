class ChangeDateOnEvent < ActiveRecord::Migration[5.2]
  def change
    remove_column :events, :event_end_date
  end
end
