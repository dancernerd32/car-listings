FactoryGirl.define do
  factory :manufacturer do
    sequence(:name) { |n| "Toyota #{n}"}
    country "Japan"
  end
end
