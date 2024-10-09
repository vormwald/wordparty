class GamesController < ApplicationController
  before_action :authenticate_user!

  def index
    @games = current_user.player.games
  end

  def new
    @game = Game.new
  end

  def create
    @game = Game.new(game_params)

    @game.players.build(user: current_user)
    if params[:game][:party_type] == "multiplayer"
    else
      @game.started_at = Time.current
      @game.status = :in_progress
    end

    if @game.save
      redirect_to @game, notice: "Game was successfully created."
    else
      render :new
    end
  end

  def show
    @game = current_user.games.find(params[:id])
  end

  def lobby
    @game = current_user.games.find(params[:id])
  end

  private

  def game_params
    params.require(:game).permit(:name, :num_letters, :num_rounds, :round_time_limit)
  end
end
