require "application_system_test_case"

class UmrahPackagesTest < ApplicationSystemTestCase
  setup do
    @umrah_package = umrah_packages(:one)
  end

  test "visiting the index" do
    visit umrah_packages_url
    assert_selector "h1", text: "Umrah Packages"
  end

  test "creating a Umrah package" do
    visit umrah_packages_url
    click_on "New Umrah Package"

    click_on "Create Umrah package"

    assert_text "Umrah package was successfully created"
    click_on "Back"
  end

  test "updating a Umrah package" do
    visit umrah_packages_url
    click_on "Edit", match: :first

    click_on "Update Umrah package"

    assert_text "Umrah package was successfully updated"
    click_on "Back"
  end

  test "destroying a Umrah package" do
    visit umrah_packages_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Umrah package was successfully destroyed"
  end
end
