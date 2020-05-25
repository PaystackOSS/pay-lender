class AddUserAndLoanTypeToLoanApplications < ActiveRecord::Migration[6.0]
  def change
    add_reference :loan_applications, :user, null: false, foreign_key: true
    add_reference :loan_applications, :loan_type, null: false, foreign_key: true
  end
end
