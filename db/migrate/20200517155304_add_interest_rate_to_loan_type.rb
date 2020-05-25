class AddInterestRateToLoanType < ActiveRecord::Migration[6.0]
  def change
    add_column :loan_types, :interest_rate, :integer
  end
end
