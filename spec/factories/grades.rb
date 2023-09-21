FactoryBot.define do
  factory :grade do
    score { 90 }
    association :student
    association :assignment
  end
end
