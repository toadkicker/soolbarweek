class Event < ApplicationRecord
  has_one :location
  has_one :profile
end
