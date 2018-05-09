class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :twitter_auth_id
      t.string :twitter_username

      t.timestamps null: false
    end
  end
end
