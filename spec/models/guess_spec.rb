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
require 'rails_helper'

RSpec.describe Guess, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
