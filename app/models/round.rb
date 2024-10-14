# == Schema Information
#
# Table name: rounds
#
#  id         :integer          not null, primary key
#  ended_at   :datetime
#  started_at :datetime
#  word       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  game_id    :integer          not null
#
# Indexes
#
#  index_rounds_on_game_id  (game_id)
#
# Foreign Keys
#
#  game_id  (game_id => games.id)
#
class Round < ApplicationRecord
  belongs_to :game

  has_many :boards, dependent: :destroy
  has_many :players, through: :boards

  validates :word, presence: true, length: {is: -> { game.num_letters }}
end
