require "application_system_test_case"

class LoanTypesTest < ApplicationSystemTestCase
  setup do
    @loan_type = loan_types(:one)
  end

  test "visiting the index" do
    visit loan_types_url
    assert_selector "h1", text: "Loan Types"
  end

  test "creating a Loan type" do
    visit loan_types_url
    click_on "New Loan Type"

    click_on "Create Loan type"

    assert_text "Loan type was successfully created"
    click_on "Back"
  end

  test "updating a Loan type" do
    visit loan_types_url
    click_on "Edit", match: :first

    click_on "Update Loan type"

    assert_text "Loan type was successfully updated"
    click_on "Back"
  end

  test "destroying a Loan type" do
    visit loan_types_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Loan type was successfully destroyed"
  end
end
