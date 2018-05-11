class AddPublishColumnOnEvent < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :publish, :boolean, null: false, default: false
  end
end
