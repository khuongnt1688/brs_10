FactoryGirl.define do
  factory :user do
    name "Khuong"
    sequence :email do |n|
      "khuongnt1688#{n}@gmail.com"
    end
    password "123456"
    password_confirmation "123456"
    role "normal"
  end
end
