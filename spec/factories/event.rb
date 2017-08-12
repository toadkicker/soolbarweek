FactoryGirl.define do
  factory :event do
    title "Event Title"
    subtitle "Event Subtitle"
    description "This is the description"
    start_time "2017-09-12 14:00:00.000000"
    end_time "2017-09-12 17:00:00.000000"
    filter_type "masterclass"
    price 9999
    max_seats 40
    association :location
    association :profile
  end
end