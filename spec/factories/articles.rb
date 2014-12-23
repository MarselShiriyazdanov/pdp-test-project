# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :article do
    title 'Article'
    text ' some text' * 10
    user
  end
end
