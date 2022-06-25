class AddDescriptionToWeapon < ActiveRecord::Migration[7.0]
  def change
    add_column :weapons, :description, :string
  end
end
