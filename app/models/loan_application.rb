# frozen_string_literal: true

class LoanApplication < ApplicationRecord
  include HTTParty
  belongs_to :loan_type

  BASE_URI = 'https://api.paystack.co/'

  # API keys from your Paystack dashboard. Always keep them hidden.
  SECRET_KEY = Rails.application.credentials.paystack[:sk_test]
  # HTTP Headers for Paystack API.
  HEADERS = {
    Authorization: 'Bearer ' + SECRET_KEY,
    'Content-Type': 'application/json'
  }.freeze

  # Fetch a list of the Banks.
  def get_banks
    HTTParty.get(BASE_URI + 'bank?country=ghana',
                 headers: HEADERS).parsed_response
  end

  # Loan disbursement
  def create_recipient(account_name, account_number, code, email, loan_type)
    # Create loan beneficiary
    recipient = HTTParty.post(BASE_URI + 'transferrecipient',
                              headers: HEADERS,
                              body: {
                                type: 'nuban',
                                name: account_name,
                                account_number: account_number,
                                bank_code: code,
                                metadata: {
                                  loan_id: loan_type
                                },
                                email: email
                              }.to_json)
  end
end
