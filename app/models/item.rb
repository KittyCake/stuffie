class Item < ApplicationRecord
  belongs_to :user # seller
  has_one :order # buyer
  has_one :renter, through: :orders,
  class_name: "User", foreign_key: "user_id" # buyer
  acts_as_taggable_on :tags

  validates :name, presence: true
  validates :price, presence: true
end
