class CreateStreamEntries < ActiveRecord::Migration
  def change
    create_table :stream_entries do |t|
      t.integer :account_id
      t.integer :activity_id
      t.string :activity_type, limit: 191

      t.timestamps null: false
    end
  end
end
