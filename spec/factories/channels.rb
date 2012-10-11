# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :channel do
    name { |n| "Channel #{n}" }
  end
end
