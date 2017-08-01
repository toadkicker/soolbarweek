class Profile < ApplicationRecord
  has_attached_file :photo, styles: { medium: "300x300>", thumb: "100x100>", nav: "40x40>" }, default_url: '/images/:attachment/missing_:style.png'
  validates_attachment_content_type :photo, content_type: /\Aimage\/.*\z/
end
