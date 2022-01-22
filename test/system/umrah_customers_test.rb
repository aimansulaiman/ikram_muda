require "application_system_test_case"

class UmrahCustomersTest < ApplicationSystemTestCase
  setup do
    @umrah_customer = umrah_customers(:one)
  end

  test "visiting the index" do
    visit umrah_customers_url
    assert_selector "h1", text: "Umrah Customers"
  end

  test "creating a Umrah customer" do
    visit umrah_customers_url
    click_on "New Umrah Customer"

    click_on "Create Umrah customer"

    assert_text "Umrah customer was successfully created"
    click_on "Back"
  end

  test "updating a Umrah customer" do
    visit umrah_customers_url
    click_on "Edit", match: :first

    click_on "Update Umrah customer"

    assert_text "Umrah customer was successfully updated"
    click_on "Back"
  end

  test "destroying a Umrah customer" do
    visit umrah_customers_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Umrah customer was successfully destroyed"
  end
end
