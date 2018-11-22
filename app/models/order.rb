class Order < ApplicationRecord
  belongs_to :user # buyer
  belongs_to :item # seller
  has_one :owner, through: :items, class_name: "User" # seller
  has_many :reviews
  validates :start_time, presence: true
  validates :end_time, presence: true
end
