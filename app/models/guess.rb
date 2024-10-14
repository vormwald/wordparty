# == Schema Information
#
# Table name: guesses
#
#  id                :integer          not null, primary key
#  correct_letters   :string           not null
#  correct_positions :string           not null
#  word              :string           not null
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  board_id          :integer          not null
#
# Indexes
#
#  index_guesses_on_board_id  (board_id)
#
# Foreign Keys
#
#  board_id  (board_id => boards.id)
#
class Guess < ApplicationRecord
  belongs_to :board

  validates :word, presence: true, length: {is: -> { board.round.game.num_letters }}
  validates :correct_letters, :correct_positions, presence: true

  before_validation :score_guess, on: :create

  private

  def score_guess
    target_word = board.round.word
    self.correct_letters = ""
    self.correct_positions = ""

    word.chars.each_with_index do |char, index|
      if target_word[index] == char
        self.correct_positions += char
      elsif target_word.include?(char)
        self.correct_letters += char
      end
    end
  end
end
