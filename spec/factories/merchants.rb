FactoryBot.define do
  factory :merchant do
    reference { Faker::Alphanumeric.alpha(number: 10) }
    email { Faker::Internet.email }
    live_on { DateTime.now }
    disbursement_frequency { [0, 1].sample }
    minimum_monthy_fee_in_cents { 10_000 }
  end
end
