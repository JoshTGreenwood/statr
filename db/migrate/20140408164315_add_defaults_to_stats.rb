class AddDefaultsToStats < ActiveRecord::Migration
  def change
  change_column :stats, :player_id, :integer, :default =>0 
  change_column :stats, :game_id, :integer, :default =>0 
  change_column :stats, :free_throw_attempts, :integer, :default =>0 
  change_column :stats, :free_throws, :integer, :default =>0 
  change_column :stats, :field_goal_attempts, :integer, :default =>0 
  change_column :stats, :field_goals, :integer, :default =>0 
  change_column :stats, :three_pointer_attempts, :integer, :default =>0 
  change_column :stats, :three_pointers, :integer, :default =>0 
  change_column :stats, :offensive_rebounds, :integer, :default =>0 
  change_column :stats, :defensive_rebounds, :integer, :default =>0 
  change_column :stats, :turnovers, :integer, :default =>0 
  change_column :stats, :personal_fouls, :integer, :default =>0 
  change_column :stats, :steals, :integer, :default =>0 
  change_column :stats, :blocks, :integer, :default =>0 
  change_column :stats, :assists, :integer, :default =>0 
  end
end
