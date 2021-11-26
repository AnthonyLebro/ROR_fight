class Fight < ApplicationRecord
  has_many :players
  has_many :characters, through: :players
  has_many :fight_logs

  accepts_nested_attributes_for :players
end
