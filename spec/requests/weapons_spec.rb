require 'rails_helper'

RSpec.describe "Weapons", type: :request do

  describe "GET /weapons" do
    it "returns success status" do
      get weapons_path
      expect(response).to have_http_status(200)
    end

    it "the weapon's name and current power is present" do
      weapons = create_list(:weapon, 3)
      get weapons_path

      weapons.each do |weapon|
        expect(response.body).to include(weapon.name, weapon.current_power)
      end
    end
  end

  describe "POST /weapons" do
    it "creates the weapon with correct attributes" do
      weapon_attributes = FactoryBot.attributes_for(:weapon)
      post weapons_path, params: { weapon: weapon_attributes }

      expect(Weapon.last).to have_attributes(weapon_attributes)
    end

    it "don't create the weapon with incorrect attributes" do
      expect {
        post weapons_path, params: { weapon: {name: '', power_base: '', power_step: '', level: ''}}
      }.to_not change(Weapon, :count)
    end
  end

  describe "DELETE /weapons" do
    it "delete id" do
      weapon = create(:weapon)
      delete "/weapons/#{weapon.id}"

      expect{ weapon.reload }.to raise_error ActiveRecord::RecordNotFound
    end
  end

  describe "SHOW /weapons" do
    let(:weapon) { create(:weapon) }
    before(:each) {  get "/weapons/#{weapon.id}" }
    
    it "deve retorna status na resposta" do
      expect(response).to have_http_status(200)
    end

        
    it "valida as informações do registro" do
      expect(response.body).to include(weapon.name, weapon.current_power, weapon.title, weapon.description)
    end
  end
end
