
json.items do
  json.array! @items do |item|
    json.id item.id
    json.name item.name
    json.price item.price
    json.description item.description
    json.image item.image
    json.created_at item.created_at.strftime('%e %b %Y %H:%M:%S%p')
  end
end


# json.user do
#   json.extract! @user, :id, :openid, :session_key, :access_token
#   json.my_items do
#     json.array! @orders do |order|
#       json.id order.id
#       json.item order.item.name
#       json.price order.price
#       json.description order.item.description
#       json.image order.item.image
#       json.created_at order.created_at.strftime('%e %b %Y %H:%M:%S%p')
#     end
#   end
# end
