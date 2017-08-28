class Gallery < ApplicationRecord
  has_attached_file :media,
                    styles: { medium: '300x300>', thumb: '100x100>', nav: '40x40>' },
                    storage: :s3,
                    url: ':s3_domain_url',
                    path: '/gallery/:id/:style/:basename.:extension',
                    s3_region: ENV['AWS_REGION'],
                    s3_credentials: proc { |a| a.instance.s3_credentials }

  validates_attachment :media,
                       content_type: {
                         content_type: %w[image/jpeg image/gif image/png video/quicktime video/mpeg application/pdf video/quicktime]
                       }

  def s3_credentials
    { bucket: ENV['S3_SBW_UPLOADS'], access_key_id: ENV['S3_SBW_ACCESS_KEY'], secret_access_key: ENV['S3_SBW_SECRET_KEY'] }
  end

end
