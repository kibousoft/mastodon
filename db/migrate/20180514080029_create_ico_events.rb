class CreateIcoEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :ico_events do |t|
      t.integer :ico_token_id
      t.datetime :begin_at
      t.datetime :end_at
      t.float :sale_limit
      t.string :name

      t.timestamps
    end
  end
end
