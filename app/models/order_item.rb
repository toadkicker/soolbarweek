class OrderItem < ApplicationRecord
  belongs_to :event, optional: true
  belongs_to :user
  belongs_to :order

  validates :quantity, presence: true, numericality: {only_integer: true, greater_than: 0}
  validate :order_present

  # validates_presence_of :event, if: lambda {|item| item.event_id.present?}
  # validates_presence_of :menu_item, if: lambda {|item| item.menu_item_id.present?}

  monetize :unit_price_cents, as: :unit_price
  monetize :total_price_cents, as: :total_price

  before_save :finalize

  after_save :reduce_quantity

  def set_unit_price
    if persisted?
      self[:unit_price_cents]
    else
      if event_id.present?
        return event.price_cents
      end
    end
  end

  def set_total_price
    unit_price_cents * quantity
  end

  private

  def order_present
    if event_id.nil?
      errors.add(:order, "is not a valid order.")
    end
  end

  def finalize
    self[:unit_price_cents] = set_unit_price
    self[:total_price_cents] = set_total_price
  end

  def reduce_quantity
    if event_id.present?
      event.max_seats = event.max_seats - quantity
      event.save!
    end
  end
end
