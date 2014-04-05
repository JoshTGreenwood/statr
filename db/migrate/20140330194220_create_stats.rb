class CreateStats < ActiveRecord::Migration
  def change
    create_table :stats do |t|
      t.integer :player_id
      t.integer :game_id
      t.integer :free_throw_attempts
      t.integer :free_throws
      t.integer :field_goal_attempts
      t.integer :field_goals
      t.integer :three_pointer_attempts
      t.integer :three_pointers
      t.integer :offensive_rebounds
      t.integer :defensive_rebounds
      t.integer :turnovers
      t.integer :personal_fouls
      t.integer :steals
      t.integer :blocks
      t.integer :assists

      t.timestamps
    end
  end
end
