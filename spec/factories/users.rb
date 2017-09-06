FactoryGirl.define do 
  factory :user do 
    username { Faker::GameOfThrones.dragon }
  end
end