require 'rails_helper'

RSpec.describe "orders/new", :type => :view do
  before(:each) do
    assign(:order, Order.new(
      :order_number => 1,
      :user_id => 1,
      :total_price => ""
    ))
  end

  it "renders new order form" do
    render

    assert_select "form[action=?][method=?]", orders_path, "post" do

      assert_select "input#order_order_number[name=?]", "order[order_number]"

      assert_select "input#order_user_id[name=?]", "order[user_id]"

      assert_select "input#order_total_price[name=?]", "order[total_price]"
    end
  end
end
