# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  email_address   :string           not null
#  password_digest :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
# Indexes
#
#  index_users_on_email_address  (email_address) UNIQUE
#
class User < ApplicationRecord
  has_secure_password
  has_many :sessions, dependent: :destroy
  has_one :player
  accepts_nested_attributes_for :player
  has_many :games, through: :player

  validates :email_address, presence: true, uniqueness: true
  validates :password, presence: true, length: {minimum: 6}, if: :password_required?

  normalizes :email_address, with: ->(e) { e.strip.downcase }

  private

  def password_required?
    new_record? || password.present?
  end
end
