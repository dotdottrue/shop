require 'rails_helper'

RSpec.describe "orders/new", :type => :view do
  before(:each) do
    assign(:order, Order.new(
      :new => "MyString",
      :cart_id => 1,
      :ip_address => "MyString",
      :first_name => "MyString",
      :last_name => "MyString",
      :card_type => "MyString"
    ))
  end

  it "renders new order form" do
    render

    assert_select "form[action=?][method=?]", orders_path, "post" do

      assert_select "input#order_new[name=?]", "order[new]"

      assert_select "input#order_cart_id[name=?]", "order[cart_id]"

      assert_select "input#order_ip_address[name=?]", "order[ip_address]"

      assert_select "input#order_first_name[name=?]", "order[first_name]"

      assert_select "input#order_last_name[name=?]", "order[last_name]"

      assert_select "input#order_card_type[name=?]", "order[card_type]"
    end
  end
end
