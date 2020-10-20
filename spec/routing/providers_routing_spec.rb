require "rails_helper"

RSpec.describe ProvidersController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/providers").to route_to("providers#index")
    end
  end
end
