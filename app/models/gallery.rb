class Gallery < ApplicationRecord
  has_attached_file :media,
                    styles: {medium: '300x300>', thumb: '100x100>', nav: '40x40>'},
                    storage: :s3,
                    url: ':s3_domain_url',
                    path: '/gallery/:id/:style/:basename.:extension',
                    s3_region: ENV['AWS_REGION'],
                    s3_credentials: proc {|a| a.instance.s3_credentials}

  validates_attachment :media,
                       content_type: {
                         content_type: %w[image/jpeg image/gif image/png application/pdf]
                       }

  has_attached_file :video,
                    :styles => {
                      :small => {:geometry => "320x240", :format => 'mp4'},
                      :medium => {:geometry => "640x480", :format => 'mp4'},
                      :poster => {:geometry => "320x240", :format => 'jpg', :time => 10}
                    },
                    :processors => [:transcoder],
                    storage: :s3,
                    url: ':s3_domain_url',
                    path: '/gallery/:id/:style/:basename.:extension',
                    s3_region: ENV['AWS_REGION'],
                    s3_credentials: proc {|a| a.instance.s3_credentials}

  validates_attachment :video,
                       content_type: {
                         content_type: %w[video/quicktime video/mpeg video/quicktime video/mp4]
                       }

  validates_attachment_presence :video, if: :media_or_video
  validates_attachment_presence :media, if: :media_or_video

  validates_presence_of :title, :description

  def media_or_video
    false unless media.present? || video.present?
  end

  def s3_credentials
    {bucket: ENV['S3_SBW_UPLOADS'], access_key_id: ENV['S3_SBW_ACCESS_KEY'], secret_access_key: ENV['S3_SBW_SECRET_KEY']}
  end

  scope :list_tags, -> {pluck(:tags).join(',').split(',').uniq}
end
