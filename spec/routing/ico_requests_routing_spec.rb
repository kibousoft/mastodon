require "rails_helper"

RSpec.describe IcoRequestsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/ico_requests").to route_to("ico_requests#index")
    end

    it "routes to #new" do
      expect(:get => "/ico_requests/new").to route_to("ico_requests#new")
    end

    it "routes to #show" do
      expect(:get => "/ico_requests/1").to route_to("ico_requests#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/ico_requests/1/edit").to route_to("ico_requests#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/ico_requests").to route_to("ico_requests#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/ico_requests/1").to route_to("ico_requests#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/ico_requests/1").to route_to("ico_requests#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/ico_requests/1").to route_to("ico_requests#destroy", :id => "1")
    end

  end
end
