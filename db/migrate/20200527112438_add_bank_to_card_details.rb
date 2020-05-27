class AddBankToCardDetails < ActiveRecord::Migration[6.0]
  def change
    add_column :card_details, :bank, :string
  end
end
