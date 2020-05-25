require "application_system_test_case"

class CardDetailsTest < ApplicationSystemTestCase
  setup do
    @card_detail = card_details(:one)
  end

  test "visiting the index" do
    visit card_details_url
    assert_selector "h1", text: "Card Details"
  end

  test "creating a Card detail" do
    visit card_details_url
    click_on "New Card Detail"

    click_on "Create Card detail"

    assert_text "Card detail was successfully created"
    click_on "Back"
  end

  test "updating a Card detail" do
    visit card_details_url
    click_on "Edit", match: :first

    click_on "Update Card detail"

    assert_text "Card detail was successfully updated"
    click_on "Back"
  end

  test "destroying a Card detail" do
    visit card_details_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Card detail was successfully destroyed"
  end
end
