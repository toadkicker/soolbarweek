class Location < ApplicationRecord
  has_many :events

  has_attached_file :photo, styles: { medium: "300x300>", thumb: "100x100>", nav: "40x40>" }, default_url: '/images/:attachment/missing_:style.png'
  validates_attachment_content_type :photo, content_type: /\Aimage\/.*\z/

  has_attached_file :logo, styles: { medium: "300x300>", thumb: "100x100>", nav: "40x40>" }, default_url: '/images/:attachment/missing_:style.png'
  validates_attachment_content_type :logo, content_type: /\Aimage\/.*\z/

  geocoded_by :full_street_address
  after_validation :geocode

  def full_street_address
    [street_address1, street_address2, city, country].compact.join(', ')
  end
end
