class CreateShields < ActiveRecord::Migration[6.0]
  def change
    create_table :shields do |t|
      t.string :name
      t.integer :power

      t.timestamps
    end
  end
end
