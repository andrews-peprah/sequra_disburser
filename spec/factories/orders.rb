FactoryBot.define do
  factory :order do
    association :merchant
    amount_in_cents { rand(10_000) }
  end
end
