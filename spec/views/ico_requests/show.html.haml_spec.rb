require 'rails_helper'

RSpec.describe "ico_requests/show", type: :view do
  before(:each) do
    @ico_request = assign(:ico_request, IcoRequest.create!(
      :amount => 2.5,
      :email => "Email",
      :eth_wallet_address => "Eth Wallet Address",
      :token_wallet_address => "Token Wallet Address"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/2.5/)
    expect(rendered).to match(/Email/)
    expect(rendered).to match(/Eth Wallet Address/)
    expect(rendered).to match(/Token Wallet Address/)
  end
end
