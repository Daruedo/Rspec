require 'rails_helper'

RSpec.describe Weapon, type: :model do
  it "title exists" do
    name = FFaker::Lorem.word
    level = FFaker::Random.rand(1..99)
    weapon = create(:weapon, name: name, level: level)

    expect(weapon.title).to eq("#{name} ##{level}")
  end

  it "current power is valid" do
    power_base = FFaker::Random.rand(1..9999)
    power_step = 100
    level = FFaker::Random.rand(1..99)
    weapon = create(:weapon, power_base: power_base, power_step: power_step, level: level)

    expect(weapon.current_power).to eq("#{power_base + ((level - 1) * power_step)}")
  end
end
