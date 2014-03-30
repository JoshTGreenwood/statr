class CreateTeamsTeams < ActiveRecord::Migration
  def change
    create_table :teams_teams do |t|
      t.belongs_to :team, index: true
      t.belongs_to :team, index: true
    end
  end
end
