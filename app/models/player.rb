class Player < ActiveRecord::Base
  has_many :won_games, foreign_key: 'winner_id', class_name: 'Game'
  has_many :lost_games, foreign_key: 'loser_id', class_name: 'Game'

  validates_presence_of :name, :rating

  scope :by_name, -> { order(:name) }

  def games_won
    won_games.count
  end

  def games_lost
    lost_games.count
  end

  def games_played
    games_won + games_lost
  end

  def add_rating!(change_in_rating)
    update_attributes!(rating: rating + change_in_rating)
  end

  def subtract_rating!(change_in_rating)
    update_attributes!(rating: rating - change_in_rating)
  end
end
