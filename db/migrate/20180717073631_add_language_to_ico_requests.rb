class AddLanguageToIcoRequests < ActiveRecord::Migration[5.1]
  def change
    add_column :ico_requests, :language, :string, limit: 10
  end
end
