require 'rails_helper'

RSpec.describe "buyers/edit", type: :view do
  before(:each) do
    @buyer = assign(:buyer, Buyer.create!(
      :name => "MyString"
    ))
  end

  it "renders the edit buyer form" do
    render

    assert_select "form[action=?][method=?]", buyer_path(@buyer), "post" do

      assert_select "input[name=?]", "buyer[name]"
    end
  end
end
