class Player < ApplicationRecord
  belongs_to :character
  belongs_to :fight
  belongs_to :weapon
  belongs_to :shield
end
