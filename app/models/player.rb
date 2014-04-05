class Player < ActiveRecord::Base
  belongs_to :team
  has_and_belongs_to_many :games
  has_many :stats, through: :games
  validates_presence_of :first_name, :last_name

  def full_name
    first_name + ' ' + last_name
  end
end
