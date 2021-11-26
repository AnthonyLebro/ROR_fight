class CreatePlayers < ActiveRecord::Migration[6.0]
  def change
    create_table :players do |t|
      t.references :character, null: false, foreign_key: true
      t.references :fight, null: false, foreign_key: true

      t.timestamps
    end
  end
end
