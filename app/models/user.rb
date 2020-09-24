# frozen_string_literal: true

class User < ApplicationRecord
  has_many :card_details
  # Don't save user passwords as strings. Use gems like Bcrypt or Devise.
  validates :first_name, :last_name, :telephone, :email, :fake_password, presence: true
  before_save { email.downcase! }
end
