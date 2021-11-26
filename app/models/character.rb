class Character < ApplicationRecord
  validates :name , uniqueness: true, presence:true
  validates :life , presence: true
  validates :attack , presence: true, inclusion: { in: 1..100 }
  validates :speed , presence: true, inclusion: { in: 1..100 }

  validate :total_points

  has_many :players , dependent: :destroy
  has_many :fights, through: :players
  has_one_attached :photo

  def total_points
    if !life.nil? && !attack.nil? && !speed.nil?
      if life + attack + speed > 200
        errors.add(:base, "J'aurai du le dire avant mais le total des points ne peut pas exeder 200 !")
      end
    end
  end
end
