FactoryGirl.define do
  factory :user do
    name 'Doe'
    email {generate :email}
    password 'password'
    password_confirmation 'password'
    locale 'en'
    is_admin false
  end
end
