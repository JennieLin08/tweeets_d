FactoryBot.define do
    factory :todo do
      name { "Valid Todo Name" }
      user
    end
  end