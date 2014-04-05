class AddOpponentNameAndDatePlayedToGames < ActiveRecord::Migration
  def change
    add_column :games, :opponent_name, :string
    add_column :games, :date_played, :date
  end
end
