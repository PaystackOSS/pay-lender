# frozen_string_literal: true

class AddColumnAccountNameToLoanApplication < ActiveRecord::Migration[6.0]
  def change
    add_column :loan_applications, :account_name, :string
  end
end
