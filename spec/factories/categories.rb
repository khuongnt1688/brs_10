FactoryGirl.define do
  factory :category do
    book
    content "novel"
  end

  factory :category_with_books do
    after :create do |category|
      4.times do
        create :book, category: category
      end
    end
  end
end
