class CreateLoanTypes < ActiveRecord::Migration[6.0]
  def change
    create_table :loan_types do |t|
      t.string :name
      t.string :description
      t.integer :max_amount
      t.integer :duration

      t.timestamps
    end
  end
end
