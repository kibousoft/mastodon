class AddCampaignNameToIcoRequests < ActiveRecord::Migration[5.1]
  def change
    add_column :ico_requests, :campaign_name, :string, limit: 100
  end
end
