class Game < ActiveRecord::Base
  belongs_to :team
  has_and_belongs_to_many :players
  has_many :stats, dependent: :destroy
end
