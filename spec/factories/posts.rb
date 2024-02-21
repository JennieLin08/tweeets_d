FactoryBot.define do
    factory :post do
      title { "Post Title" }
      content { "Post content" }
      user
    end
  end