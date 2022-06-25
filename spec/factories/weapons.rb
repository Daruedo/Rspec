FactoryBot.define do
  factory :weapon do
    name { FFaker::Lorem.word }
    power_base { FFaker::Random.rand(1..9999) }
    power_step { 100 }
    level { FFaker::Random.rand(1..99) }
    description { FFaker::Lorem.phrase }
  end
end
