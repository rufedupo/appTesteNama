require 'rails_helper'

RSpec.describe "buyers/show", type: :view do
  before(:each) do
    @buyer = assign(:buyer, Buyer.create!(
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
  end
end
