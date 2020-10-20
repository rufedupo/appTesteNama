require 'rails_helper'

RSpec.describe "buyers/new", type: :view do
  before(:each) do
    assign(:buyer, Buyer.new(
      :name => "MyString"
    ))
  end

  it "renders new buyer form" do
    render

    assert_select "form[action=?][method=?]", buyers_path, "post" do

      assert_select "input[name=?]", "buyer[name]"
    end
  end
end
