class Player < ActiveRecord::Base
  belongs_to :team
  has_many :games, through: :stats
  has_many :stats
  validates_presence_of :first_name, :last_name

  def full_name
    first_name + ' ' + last_name
  end

  def stat_per_game(stat)
    if stat == :points
      stats.group(:id, :game_id).pluck(:free_throws, :field_goals, :three_pointers).map {|s| s[0] + (s[1] * 2)  + (s[2]*3) }
    else
      stats.group(:id, :game_id).pluck(stat)
    end
  end

end
