# == Schema Information
#
# Table name: players
#
#  id            :integer          not null, primary key
#  avatar_url    :string
#  name          :string           not null
#  session_token :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  user_id       :integer
#
# Indexes
#
#  index_players_on_session_token  (session_token) UNIQUE
#  index_players_on_user_id        (user_id)
#
# Foreign Keys
#
#  user_id  (user_id => users.id)
#
require 'rails_helper'

RSpec.describe Player, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
