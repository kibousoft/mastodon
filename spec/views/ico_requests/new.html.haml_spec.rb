require 'rails_helper'

RSpec.describe "ico_requests/new", type: :view do
  before(:each) do
    assign(:ico_request, IcoRequest.new(
      :amount => 1.5,
      :email => "MyString",
      :eth_wallet_address => "MyString",
      :token_wallet_address => "MyString"
    ))
  end

  it "renders new ico_request form" do
    render

    assert_select "form[action=?][method=?]", ico_requests_path, "post" do

      assert_select "input[name=?]", "ico_request[amount]"

      assert_select "input[name=?]", "ico_request[email]"

      assert_select "input[name=?]", "ico_request[eth_wallet_address]"

      assert_select "input[name=?]", "ico_request[token_wallet_address]"
    end
  end
end
