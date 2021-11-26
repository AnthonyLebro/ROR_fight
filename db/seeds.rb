Player.delete_all
FightLog.delete_all
Fight.delete_all
Character.delete_all
Shield.delete_all
Weapon.delete_all

SHIELDS = ['Grosse bulle', '7 boules de cristal', 'Alchimie de Ulric', 'Epave de Barque', 'Psychisme de Mewtwo', 'Barriere de corail de Brice de Nice']
WEAPONS = ['Bouteille en plastique', 'Trident', 'Encre rouillée', 'Bois flotté', 'Corail', 'Jambe de bois de Pirate']
CHARACTERS = ['Sillure', 'Carpe-Koi', 'Piranha', 'Poisson-Lune', 'Requin Marteau', 'Raie-manta', 'Murène Electrique']


# Create shields
SHIELDS.each do |shield_name|
  Shield.create(name: shield_name, power: rand(1..100))
end


# Create weapons
WEAPONS.each do |weapon_name|
  Weapon.create(name: weapon_name, power: rand(1..100))
end


# Create Characters

CHARACTERS.each_with_index do |character_name, index|
  speed = rand(1..100)
  attack = rand(1..100)
  life = 200 - speed - attack
  new_character = Character.new(name: character_name, life: life, attack: attack, speed: speed)
  new_character.save!

end