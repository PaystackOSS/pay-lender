require "application_system_test_case"

class LoanApplicationsTest < ApplicationSystemTestCase
  setup do
    @loan_application = loan_applications(:one)
  end

  test "visiting the index" do
    visit loan_applications_url
    assert_selector "h1", text: "Loan Applications"
  end

  test "creating a Loan application" do
    visit loan_applications_url
    click_on "New Loan Application"

    click_on "Create Loan application"

    assert_text "Loan application was successfully created"
    click_on "Back"
  end

  test "updating a Loan application" do
    visit loan_applications_url
    click_on "Edit", match: :first

    click_on "Update Loan application"

    assert_text "Loan application was successfully updated"
    click_on "Back"
  end

  test "destroying a Loan application" do
    visit loan_applications_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Loan application was successfully destroyed"
  end
end
