FactoryGirl.define do
  factory :book do
    category
    sequence :title do |n|
      "tieudesach#{n}"
    end
    publish_date "2015-06-15"
    author "tentacgia"
    number_of_pages "200"
  end

end
