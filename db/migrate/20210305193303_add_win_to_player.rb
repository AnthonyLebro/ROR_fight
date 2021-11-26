class AddWinToPlayer < ActiveRecord::Migration[6.0]
  def change
    add_column :players, :win, :boolean, :default => false
  end
end
