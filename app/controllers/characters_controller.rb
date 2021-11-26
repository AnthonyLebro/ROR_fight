class CharactersController < ApplicationController
  before_action :set_character, only: [:show, :edit, :destroy, :update]

  def new
    @character = Character.new
  end

  def create
    @character = Character.new(params_character)

    if @character.save
      redirect_to characters_path
    else
      render :new
    end
  end

  def index
    @characters = Character.all
  end

  def update
    @character.update(params_character)
    redirect_to character_path(@character)
  end

  def destroy
    @character.destroy
    redirect_to characters_path
  end

  private

  def set_character
    @character = Character.find(params[:id])
  end

  def params_character
    params.require(:character).permit(:name, :life, :attack, :speed, :photo)
  end
end
