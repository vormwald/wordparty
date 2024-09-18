# == Schema Information
#
# Table name: boards
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  player_id  :integer          not null
#  round_id   :integer          not null
#
# Indexes
#
#  index_boards_on_player_id               (player_id)
#  index_boards_on_round_id                (round_id)
#  index_boards_on_round_id_and_player_id  (round_id,player_id) UNIQUE
#
# Foreign Keys
#
#  player_id  (player_id => players.id)
#  round_id   (round_id => rounds.id)
#
class Board < ApplicationRecord
  belongs_to :round
  belongs_to :player
  has_many :guesses, dependent: :destroy

  validates :round_id, uniqueness: { scope: :player_id }
  validates :player_id, uniqueness: { scope: :round_id }
end
