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
require 'rails_helper'

RSpec.describe Round, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
