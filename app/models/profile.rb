class Profile < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged

  has_attached_file :photo,
                    styles: {medium: "300x300>", thumb: "100x100>", nav: "40x40>"},
                    default_url: '/images/:attachment/missing_:style.png',
                    storage: :s3,
                    url: ":s3_domain_url",
                    path: '/profile/:id/:style/:basename.:extension',
                    s3_region: ENV['AWS_REGION'],
                    s3_credentials: proc {|a| a.instance.s3_credentials}

  validates_attachment_content_type :photo, content_type: /\Aimage\/.*\z/

  def s3_credentials
    {bucket: ENV['S3_SBW_UPLOADS'], access_key_id: ENV['S3_SBW_ACCESS_KEY'], secret_access_key: ENV['S3_SBW_SECRET_KEY'], region: ENV['AWS_REGION']}
  end

  scope :active, -> {where(:is_active => true)}
  scope :sort_by_name, -> {order(:name)}

  default_scope {sort_by_name}
end
