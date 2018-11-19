class Order < ApplicationRecord
  belongs_to :user # buyer
  belongs_to :item # seller
  has_one :owner, through: :items, class_name: "User" # seller
end
