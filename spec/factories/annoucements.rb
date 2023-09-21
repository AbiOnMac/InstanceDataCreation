FactoryBot.define do
  factory :announcement do
    title { "Announcement Title" }
    content { "Announcement Content" }
    association :course
  end
end
