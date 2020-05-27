# frozen_string_literal: true

class CardDetail < ApplicationRecord
  include HTTParty
  belongs_to :user

  BASE_URI = 'https://api.paystack.co/'

  # API keys can be found in your dashboard. Always keep them hidden.
  SECRET_KEY = Rails.application.credentials.paystack[:sk_test]
  # HTTP Headers for Paystack API.
  HEADERS = {
    Authorization: 'Bearer ' + SECRET_KEY,
    'Content-Type': 'application/json'
  }.freeze

  def initialize_transaction(email, root_url)
    HTTParty.post(BASE_URI + 'transaction/initialize',
                  headers: HEADERS,
                  body: {
                    email: email,
                    amount: 200,
                    callback_url: "#{root_url}/create-card"
                  }.to_json)
  end

  # Fetch the transaction from verify endpoint.
  def verify_transaction(transaction_ref)
    HTTParty.get("#{BASE_URI}transaction/verify/#{transaction_ref}",
                 headers: HEADERS)
  end
end
