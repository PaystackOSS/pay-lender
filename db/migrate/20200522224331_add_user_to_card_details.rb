# frozen_string_literal: true

class AddUserToCardDetails < ActiveRecord::Migration[6.0]
  def change
    add_reference :card_details, :user, null: false, foreign_key: true
  end
end
