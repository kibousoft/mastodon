require 'rails_helper'

RSpec.describe "IcoRequests", type: :request do
  describe "GET /ico_requests" do
    it "works! (now write some real specs)" do
      get ico_requests_path
      expect(response).to have_http_status(200)
    end
  end
end
