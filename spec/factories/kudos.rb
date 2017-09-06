FactoryGirl.define do 
  factory :kudo do 
    text { Faker::HitchhikersGuideToTheGalaxy.quote[0..139] }
    association :giver, factory: :user
    association :receiver, factory: :user
  end
end