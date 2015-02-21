json.array!(@orders) do |order|
  json.extract! order, :id, :order_number, :user_id, :total_price, :order_date
  json.url order_url(order, format: :json)
end
