class Game < ActiveRecord::Base
  belongs_to :team
  has_and_belongs_to_many :players
  has_many :stats, dependent: :destroy

  validates_presence_of :team, :opponent_name, :date_played

  after_create {|game| game.team.players.each{|player| Stat.create(game_id:game.id, player_id: player.id)}}
end
