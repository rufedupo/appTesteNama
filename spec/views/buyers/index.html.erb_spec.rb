require 'rails_helper'

RSpec.describe "buyers/index", type: :view do
  before(:each) do
    assign(:buyers, [
      Buyer.create!(
        :name => "Name"
      ),
      Buyer.create!(
        :name => "Name"
      )
    ])
  end

  it "renders a list of buyers" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
