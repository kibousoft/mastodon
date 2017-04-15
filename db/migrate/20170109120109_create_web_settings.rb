class CreateWebSettings < ActiveRecord::Migration[5.0]
  def change
    create_table :web_settings do |t|
      t.integer :user_id
      t.text :data

      t.timestamps
    end

    add_index :web_settings, :user_id, unique: true
  end
end
