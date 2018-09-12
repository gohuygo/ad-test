FactoryBot.define do
  factory :vote do
    user_id      { 1 }
    billboard_id { 1 }
    direction    { 1 }
  end
end
