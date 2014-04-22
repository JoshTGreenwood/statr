FactoryGirl.define do
  factory :user do
    email 'testemail@google.com'
    password 'password'
  end

  factory :team do
    user
    name 'Cardinals'
  end
end
