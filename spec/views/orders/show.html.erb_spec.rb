require 'rails_helper'

RSpec.describe "orders/show", :type => :view do
  before(:each) do
    @order = assign(:order, Order.create!(
      :new => "New",
      :cart_id => 1,
      :ip_address => "Ip Address",
      :first_name => "First Name",
      :last_name => "Last Name",
      :card_type => "Card Type"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/New/)
    expect(rendered).to match(/1/)
    expect(rendered).to match(/Ip Address/)
    expect(rendered).to match(/First Name/)
    expect(rendered).to match(/Last Name/)
    expect(rendered).to match(/Card Type/)
  end
end
