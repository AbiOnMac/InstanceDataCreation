FactoryBot.define do
  factory :vacancy do
    title { "Job Vacancy Title" }
    association :site
  end
end
