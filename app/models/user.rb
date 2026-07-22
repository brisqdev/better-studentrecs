class User < ApplicationRecord
  has_secure_password
  has_many :sessions, dependent: :destroy

  normalizes :email_address, with: ->(e) { e.strip.downcase }
  has_secure_token :public_token, on: :initialize
  validates :role, inclusion: { in: %w[system_admin admissions_officer school_counselor teacher applicant] }
end
