# frozen_string_literal: true

class AddColumnBanksToLoanApplication < ActiveRecord::Migration[6.0]
  def change
    add_column :loan_applications, :banks, :string
  end
end
