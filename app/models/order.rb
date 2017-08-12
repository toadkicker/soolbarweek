class Order < ApplicationRecord
  belongs_to :order_status
  belongs_to :user

  has_many :order_items
  before_create :set_order_status
  before_save :update_subtotal
  before_save :finalize

  monetize :subtotal_cents, as: :subtotal
  monetize :tax_cents, as: :tax
  monetize :shipping_cents, as: :shipping
  monetize :total_cents, as: :total

  scope :default, -> {where(default: true)}

  def set_subtotal
    order_items.collect {|oi| oi.valid? ? (oi.quantity * oi.unit_price_cents) : 0}.sum
  end

  private

  def set_order_status
    self.order_status_id = (self.order_status_id.nil? ? self.order_status.default : self.order_status_id)
  end

  def update_subtotal
    self[:subtotal_cents] = set_subtotal
  end

  def finalize
    set_order_status
    update_subtotal
  end
end
