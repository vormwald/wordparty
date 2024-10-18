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
class Game < ApplicationRecord
  has_many :rounds, dependent: :destroy
  has_many :boards, through: :rounds
  has_many :game_players, dependent: :destroy
  has_many :players, through: :game_players

  validates :round_time_limit, :num_rounds, :num_letters, presence: true, numericality: {greater_than: 0}
  validates :invite_code, presence: true, uniqueness: true
  validates :status, presence: true

  enum status: [:pending, :in_progress, :completed]

  before_validation :generate_invite_code, on: :create
  before_validation :set_default_status, on: :create

  # You might want to add some custom methods here, for example:
  def start!
    update!(status: :in_progress, started_at: Time.current)
  end

  def end!
    update!(status: :completed, ended_at: Time.current)
  end

  private

  def generate_invite_code
    self.invite_code = SecureRandom.alphanumeric(4).upcase
  end

  def set_default_status
    self.status ||= :pending
  end
end
