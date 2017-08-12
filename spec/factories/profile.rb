FactoryGirl.define do
  factory :profile do
    name "Foo Manchu"
    slug "foo-manchu"
    description "Foo Manchu has a description"
    photo_file_name "beckaly_franks.jpg"
    photo_content_type "image/jpeg"
    photo_file_size 269341
    photo_updated_at DateTime.current
    tags "chef, speaker"
    is_active true
  end
end