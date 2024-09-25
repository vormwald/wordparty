# == Schema Information
#
# Table name: games
#
#  id               :integer          not null, primary key
#  ended_at         :datetime
#  invite_code      :string           not null
#  num_letters      :integer          not null
#  num_rounds       :integer          not null
#  round_time_limit :integer          not null
#  started_at       :datetime
#  status           :integer          default("pending"), not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
# Indexes
#
#  index_games_on_invite_code  (invite_code) UNIQUE
#
require 'rails_helper'

RSpec.describe Game, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
