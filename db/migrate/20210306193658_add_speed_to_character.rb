class AddSpeedToCharacter < ActiveRecord::Migration[6.0]
  def change
    add_column :characters, :speed, :integer
  end
end
