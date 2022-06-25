class WeaponsController < ApplicationController
  def index
    @weapons = Weapon.all
  end

  def show
    id = params[:id].to_i
    @weapon =  Weapon.find(id)
  end

  def create
    @weapon = Weapon.create(weapon_params)
    redirect_to weapons_path
  end

  def destroy
    @weapon = Weapon.find(params[:id])
    @weapon.destroy
    head 204
  end

  private

  def weapon_params
    params.require(:weapon).permit(:name, :power_base, :power_step, :level, :description)
  end
end
