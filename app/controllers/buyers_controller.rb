class BuyersController < ApplicationController
  def index
    @buyers = Buyer.all
  end
end
