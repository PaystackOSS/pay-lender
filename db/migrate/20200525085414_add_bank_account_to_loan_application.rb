class AddBankAccountToLoanApplication < ActiveRecord::Migration[6.0]
  def change
    add_column :loan_applications, :account_number, :string
  end
end
