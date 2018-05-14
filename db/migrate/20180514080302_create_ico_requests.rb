class CreateIcoRequests < ActiveRecord::Migration[5.1]
  def change
    create_table :ico_requests do |t|
      t.integer :user_id
      t.integer :ico_event_id
      t.float :amount
      t.string :email
      t.string :eth_wallet_address
      t.string :token_wallet_address

      t.timestamps
    end
  end
end
