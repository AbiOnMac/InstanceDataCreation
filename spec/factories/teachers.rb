FactoryBot.define do
  factory :teacher do
    association :user
    qualification { "Ph.D. in XYZ" }
  end
end
