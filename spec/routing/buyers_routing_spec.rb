require "rails_helper"

RSpec.describe BuyersController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/buyers").to route_to("buyers#index")
    end
  end
end
