class RenameFlatLogToFightLog < ActiveRecord::Migration[6.0]
  def change
    rename_table :flat_logs, :fight_logs
  end
end
