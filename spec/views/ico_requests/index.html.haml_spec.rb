require 'rails_helper'

RSpec.describe "ico_requests/index", type: :view do
  before(:each) do
    assign(:ico_requests, [
      IcoRequest.create!(
        :amount => 2.5,
        :email => "Email",
        :eth_wallet_address => "Eth Wallet Address",
        :token_wallet_address => "Token Wallet Address"
      ),
      IcoRequest.create!(
        :amount => 2.5,
        :email => "Email",
        :eth_wallet_address => "Eth Wallet Address",
        :token_wallet_address => "Token Wallet Address"
      )
    ])
  end

  it "renders a list of ico_requests" do
    render
    assert_select "tr>td", :text => 2.5.to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => "Eth Wallet Address".to_s, :count => 2
    assert_select "tr>td", :text => "Token Wallet Address".to_s, :count => 2
  end
end
