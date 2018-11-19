class Item < ApplicationRecord
  belongs_to :user # seller
  has_many :orders # buyer
  has_one :renter, through: :orders,
  class_name: "User", foreign_key: "user_id" # buyer

  validates :name, presence: true
  validates :price, presence: true
end
