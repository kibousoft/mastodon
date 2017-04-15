class AddProfileFieldsToAccounts < ActiveRecord::Migration
  def change
    add_column :accounts, :note, :text, null: true
    add_column :accounts, :display_name, :string, null: false, default: ''
    add_column :accounts, :uri, :string, null: false, default: ''
  end
end
