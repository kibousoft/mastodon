require 'rails_helper'

RSpec.describe "ico_requests/edit", type: :view do
  before(:each) do
    @ico_request = assign(:ico_request, IcoRequest.create!(
      :amount => 1.5,
      :email => "MyString",
      :eth_wallet_address => "MyString",
      :token_wallet_address => "MyString"
    ))
  end

  it "renders the edit ico_request form" do
    render

    assert_select "form[action=?][method=?]", ico_request_path(@ico_request), "post" do

      assert_select "input[name=?]", "ico_request[amount]"

      assert_select "input[name=?]", "ico_request[email]"

      assert_select "input[name=?]", "ico_request[eth_wallet_address]"

      assert_select "input[name=?]", "ico_request[token_wallet_address]"
    end
  end
end
