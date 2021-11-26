class AddColumnsToPlayer < ActiveRecord::Migration[6.0]
  def change
    add_reference :players, :weapon, foreign_key: true
    add_reference :players, :shield, foreign_key: true
  end
end
