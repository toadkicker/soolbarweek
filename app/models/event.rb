class Event < ApplicationRecord
  belongs_to :location
  belongs_to :profile

  monetize :price_cents

  validates_presence_of :title, :short_description, :description,
                        :start_time, :end_time, :price, :profile, :location, :max_seats

  scope :by_day, -> { order(:start_time).group_by {|p| p.start_time.to_date } }
  scope :by_hour, -> { order(:start_time).group_by {|p| p.start_time.hour } }
  scope :days, -> { pluck('distinct date(start_time)') }
  scope :by_type, ->(type) {where(filter_type: type)}

end