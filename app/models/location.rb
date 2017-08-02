class Location < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged

  has_many :events

  has_attached_file :photo,
                    styles: { medium: "300x300>", thumb: "100x100>", nav: "40x40>" },
                    default_url: '/images/:attachment/missing_:style.png',
                    storage: :s3,
                    url: ":s3_domain_url",
                    path: '/location/:id/:style/:basename.:extension',
                    s3_region: ENV['AWS_REGION'],
                    s3_credentials: proc { |a| a.instance.s3_credentials }

  validates_attachment_content_type :photo, content_type: /\Aimage\/.*\z/

  has_attached_file :logo,
                    styles: { medium: "300x300>", thumb: "100x100>", nav: "40x40>" },
                    default_url: '/images/:attachment/missing_:style.png',
                    storage: :s3,
                    path: '/location/:id/:style/:basename.:extension',
                    url: ":s3_domain_url",
                    s3_region: ENV['AWS_REGION'],
                    s3_credentials: proc { |a| a.instance.s3_credentials }

  validates_attachment_content_type :logo, content_type: /\Aimage\/.*\z/

  geocoded_by :full_street_address
  after_validation :geocode

  def full_street_address
    [street_address1, street_address2, city, country].compact.join(', ')
  end

  def s3_credentials
    { bucket: ENV['S3_SBW_UPLOADS'], access_key_id: ENV['S3_SBW_ACCESS_KEY'], secret_access_key: ENV['S3_SBW_SECRET_KEY'] }
  end

end
