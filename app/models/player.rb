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
#  game_id       :integer
#  user_id       :integer
#
# Indexes
#
#  index_players_on_game_id        (game_id)
#  index_players_on_session_token  (session_token) UNIQUE
#  index_players_on_user_id        (user_id)
#
# Foreign Keys
#
#  game_id  (game_id => games.id)
#  user_id  (user_id => users.id)
#
class Player < ApplicationRecord
  belongs_to :user, optional: true
  has_many :games_players, dependent: :destroy
  has_many :games, through: :games_players
  has_many :boards, dependent: :destroy

  validates :name, presence: true
  validates :session_token, uniqueness: true, allow_nil: true

  before_create :generate_session_token, unless: :user_id?

  def visitor?
    user_id.nil?
  end

  private

  def generate_session_token
    self.session_token = SecureRandom.urlsafe_base64(16)
  end
end
