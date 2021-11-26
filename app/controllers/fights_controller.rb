class FightsController < ApplicationController
  def index
    @fights = Fight.all
  end

  def show
    @fight = Fight.find(params[:id])
  end

  def new
    @fight = Fight.new
    @fight.players.build
    @fight.players.build
  end

  def create
    @fight = Fight.new(fight_params)
    if @fight.save
      FightSimulator.new(@fight).simulate_fight
      redirect_to fight_path(@fight)
    else
      render :new
    end
  end

  private

  def fight_params
    params.require(:fight).permit(players_attributes: [:id, :character_id, :weapon_id, :shield_id])
  end
end
