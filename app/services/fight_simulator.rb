class FightSimulator
  def initialize(fight)
    @fight = fight
  end

  def simulate_fight
    # implement fight simulation
    player1 = @fight.players[0]
    player2 = @fight.players[1]

    while player1.character.life > 0
      #player 1 attacks
      attack(player1, player2)
      #check survivor
      break if player2.character.life <= 0
      # player 2 attacks
      attack(player2, player1)

    end
    player1.win = player2.character.life <= 0
    player2.win = !player1.win

    if player1.win
      add_log(@fight, " #{player1.character.name } A gagné ! Bravo !")
    else
      add_log(@fight, " #{player2.character.name } Remporte le combat ! Félicitation !")
    end
    player1.save
    player2.save
  end

  private

  def evade?(player)
    rand < player.character.speed/100.0
  end

  def add_log(fight, move_description)
    log = FightLog.new()
    log.fight = fight
    log.move_description = move_description
    log.save
  end

  def attack(player1, player2)
    if evade?(player2)
      add_log(@fight, " #{player2.character.name } esquive l'attaque de  #{player1.character.name} Incroyable ! ")
    else
      if player2.shield.power > 0
        player2.shield.power -= (player1.character.attack + player1.weapon.power) / 10
        add_log(@fight,  " #{player2.character.name } bloque l'attaque de #{player1.character.name } avec #{player2.shield.name} ! Impressionnant ! ")
      else
        player2.character.life -= (player1.character.attack + player1.weapon.power) / 10
        add_log(@fight, " #{player1.character.name } inflige #{(player1.character.attack + player1.weapon.power) / 10} dommage à #{player2.character.name } ! Quelle violence!")
      end
    end
  end
end
