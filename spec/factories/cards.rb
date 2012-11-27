FactoryGirl.define do
  factory :card do
    native_word { Faker::Lorem.word }
    foreign_word { Faker::Lorem.word }

    factory :invalid_card do
      native_word nil
    end
  end
end