class CreateTickets < ActiveRecord::Migration[5.2]
  def change
    create_table :tickets do |t|
      t.belongs_to :event, index: true
      t.string :ticket_name
      t.string :ticket_detail
      t.string :ticket_price
      t.timestamps
    end
  end
end
