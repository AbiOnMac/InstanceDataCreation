FactoryBot.define do
  factory :student do
    association :user
    date_of_birth { Date.new(2000, 1, 1) }
  end
end
