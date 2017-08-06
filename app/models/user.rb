class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_attached_file :photo,
                    styles: { medium: '300x300>', thumb: '100x100>', nav: '40x40>' },
                    default_url: '/images/:attachment/missing_:style.png',
                    storage: :s3,
                    url: ":s3_domain_url",
                    path: '/user/:id/:style/:basename.:extension',
                    s3_region: ENV['AWS_REGION'],
                    s3_credentials: proc { |a| a.instance.s3_credentials }

  validates_attachment_content_type :photo, content_type: /\Aimage\/.*\z/

  @skip = false

  def s3_credentials
    { bucket: ENV['S3_SBW_UPLOADS'], access_key_id: ENV['S3_SBW_ACCESS_KEY'], secret_access_key: ENV['S3_SBW_SECRET_KEY'] }
  end

  def skip_notifications!
    skip_confirmation_notification!
    @skip = true
  end

  def email_changed?
    return false if @skip
    super
  end

  def encrypted_password_changed?
    return false if @skip
    super
  end
end
