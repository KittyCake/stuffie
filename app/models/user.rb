class User < ApplicationRecord
  has_many :items
  has_many :orders
  has_many :borrowed_items, through: :orders, class_name: "Item"
end
