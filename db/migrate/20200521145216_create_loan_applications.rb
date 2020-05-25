class CreateLoanApplications < ActiveRecord::Migration[6.0]
  def change
    create_table :loan_applications do |t|
      t.integer :req_amount
      t.integer :repay_amount
      t.date :due_date
      t.timestamps
    end
  end
end
