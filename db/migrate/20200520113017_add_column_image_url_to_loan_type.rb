# frozen_string_literal: true

class AddColumnImageUrlToLoanType < ActiveRecord::Migration[6.0]
  def change
    add_column :loan_types, :image_url, :string
  end
end
