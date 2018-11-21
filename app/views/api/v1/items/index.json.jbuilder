json.items do
  json.array! @items do |item|
    json.extract! item, :id, :name, :price, :image, :description, :status, :user_id
  end
end
