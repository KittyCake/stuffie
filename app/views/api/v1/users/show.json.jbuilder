json.user do
  json.extract! @user, :id, :openid, :session_key, :access_token
  json.my_orders do
    json.array! @orders do |order|
      json.id order.id
      json.item order.item.name
      json.price order.price
      json.created_at order.created_at.strftime('%e %b %Y %H:%M:%S%p')
    end
  end
  json.ordered do
    json.array! @ordered do |order|
      json.id order.id
      json.item order.item.name
      json.price order.price
      json.created_at order.created_at.strftime('%e %b %Y %H:%M:%S%p')
    end
  end
end
