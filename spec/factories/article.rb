FactoryBot.define do
  factory :article do
    title { "Sprint on Rails" }
    description { "P'Mac geng mak" }
    status { "published" }

    trait :draft do
      title { "Draft Title" }
      description { "Draft description" }
      status { "draft" }
    end

    trait :waiting_for_review do
      title { "Review Title" }
      description { "Review description" }
      status { "waiting_for_review" }
    end

    trait :published do
      title { "Published Title" }
      description { "Published description" }
      status { "published" }
    end
  end
end
