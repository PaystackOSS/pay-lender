# frozen_string_literal: true

class CreateCardDetails < ActiveRecord::Migration[6.0]
  def change
    create_table :card_details do |t|
      t.string :auth_code
      t.string :bin
      t.string :last_four
      t.string :brand
      t.string :country_code

      t.timestamps
    end
  end
end
