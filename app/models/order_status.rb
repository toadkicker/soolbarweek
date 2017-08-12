class OrderStatus < ApplicationRecord
  has_many :orders
  scope :default, -> {where(default: true).first}
end
