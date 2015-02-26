require 'rails_helper'

describe ProductCategory do

	product_categories = FactoryGirl.build(:product_category) 

	it "returns the concatenated product_id" do
		expect(product_categories.product_id).to eq 1
	end

	it "returns the concatenated category id" do
		expect(product_categories.category_id).to eq 2
	end

	it "returns the concatenated category id" do
		expect(product_categories.created_at).to eq nil
	end

	it "returns the concatenated category id" do
		expect(product_categories.updated_at).to eq nil
	end


end
