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

  def initialize_transaction(email)
    HTTParty.post(BASE_URI + 'transaction/initialize',
                  headers: HEADERS,
                  body: {
                    email: email,
                    amount: 10_000,
                    callback_url: 'https://pay-lender.herokuapp.com/create-card'
                  }.to_json)
  end

  # Fetch the transaction from verify endpoint.
  def verify_transaction(transaction_ref)
    verify = HTTParty.get(BASE_URI + "transaction/verify/#{transaction_ref}",
                          headers: HEADERS)

    # puts verify['data']
  end
end
