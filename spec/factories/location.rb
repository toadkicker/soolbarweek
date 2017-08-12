FactoryGirl.define do
  factory :location do
    name "B28"
    description "B28 is a bar"
    slug "b28"
    photo_file_name "faker.jpg"
    photo_content_type "image/jpeg"
    photo_file_size 86753
    photo_updated_at DateTime.current
    street_address1 "97 Saemunan-ro"
    street_address2 "Jongno-gu"
    city "Seoul"
    country "South Korea"
    neighborhood "Gwanghwamun/Myeondong"
    telephone "02-6388-5000"
    marker_x 224.68
    marker_y 161.92
    marker_number 3
    marker_color '#8f1e23'
    marker_height 13.72
    marker_width 13.72
  end
end