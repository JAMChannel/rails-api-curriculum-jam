FactoryBot.define do
  factory :micropost do
    user
    content { "MyText" }
  end
end
