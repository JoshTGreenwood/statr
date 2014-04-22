class PlayersController < ApplicationController
  before_action :require_user_signed_in
  before_action :set_player, only: [:show, :edit, :update, :destroy]

  # GET /players
  # GET /players.json
  def index
    @team = Team.find(params[:team_id])
    @players = @team.players
  end

  # GET /players/1
  # GET /players/1.json
  def show
    @chart = LazyHighCharts::HighChart.new('area') do |f|
      f.title(:text => "Shots")
      f.xAxis(:categories => @player.games.pluck(:opponent_name))

      f.series(:name => "Points", :yAxis => 0, :data => @player.stat_per_game(:points)) 

      f.series(:name => "Field Goals", :yAxis => 0, :data => @player.stat_per_game(:field_goals)) 

      f.series(:name => "Free Throws", :yAxis => 0, :data => @player.stat_per_game(:free_throws)) 

      f.series(:name => "Three Pointers", :yAxis => 0, :data => @player.stat_per_game(:three_pointers)) 

      f.legend(:align => 'right', :verticalAlign => 'top', :y => 75, :x => -50, :layout => 'vertical',)

      f.chart({defaultSeriesType: "column"})
    end
  end


  # GET /players/new
  def new
    @player = Player.new
    @team = Team.find params[:team_id]
  end

  # GET /players/1/edit
  def edit
    @team = @player.team
  end

  # POST /players
  # POST /players.json
  def create
    @player = Player.new(player_params)

    respond_to do |format|
      if @player.save
        format.html { redirect_to @player, notice: 'Player was successfully created.' }
        format.json { render action: 'show', status: :created, location: @player }
      else
        format.html { render action: 'new' }
        format.json { render json: @player.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /players/1
  # PATCH/PUT /players/1.json
  def update
    respond_to do |format|
      if @player.update(player_params)
        format.html { redirect_to @player, notice: 'Player was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @player.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /players/1
  # DELETE /players/1.json
  def destroy
    @player.destroy
    respond_to do |format|
      format.html { redirect_to players_url(team_id: @player.team.id) }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_player
      @player = Player.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def player_params
      params.require(:player).permit(:team_id, :jersey_number, :first_name, :last_name)
    end
end
