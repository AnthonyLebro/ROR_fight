class CreateFlatLogs < ActiveRecord::Migration[6.0]
  def change
    create_table :flat_logs do |t|
      t.references :fight, null: false, foreign_key: true
      t.text :move_description

      t.timestamps
    end
  end
end
