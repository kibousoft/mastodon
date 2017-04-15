class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.string :username, null: false
      t.string :domain, null: true

      # PuSH credentials
      t.string :verify_token, null: false
      t.string :secret, null: false

      # RSA key pair
      t.text :private_key, null: true
      t.text :public_key, null: false

      # URLs
      t.string :remote_url, null: false
      t.string :salmon_url, null: false
      t.string :hub_url, null: false

      t.timestamps null: false
    end

    add_index :accounts, [:username, :domain], unique: true
  end
end
