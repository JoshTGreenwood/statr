class StatsController < ApplicationController
  before_filter :require_user_signed_in
  before_filter :set_stat_and_game
  def update
    respond_to do |format|
      if @stat.update(stat_params)
        format.html { redirect_to @game, notice: 'Game was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @game.errors, status: :unprocessable_entity }
      end
    end
  end

  private 

  def set_stat_and_game
    @stat = Stat.find(params[:id])
    @game = Game.find(@stat.game)
  end


  
  def stat_params
    params.permit(:player_id, :game_id, :free_throw_attempts, :free_throws, :field_goal_attempts, :field_goals, :three_pointer_attempts,
                                  :three_pointers, :offensive_rebounds, :defensive_rebounds, :turnovers, :personal_fouls, :steals, :blocks, :assists)
  end
end
