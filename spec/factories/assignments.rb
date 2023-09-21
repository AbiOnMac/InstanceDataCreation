FactoryBot.define do
  factory :assignment do
    title { "Assignment Title" }
    description { "Assignment Description" }
    association :course
  end
end
