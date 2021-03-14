require "application_system_test_case"

class PsksTest < ApplicationSystemTestCase
  setup do
    @psk = psks(:one)
  end

  test "visiting the index" do
    visit psks_url
    assert_selector "h1", text: "Psks"
  end

  test "creating a Psk" do
    visit psks_url
    click_on "New Psk"

    fill_in "Psk", with: @psk.psk
    click_on "Create Psk"

    assert_text "Psk was successfully created"
    click_on "Back"
  end

  test "updating a Psk" do
    visit psks_url
    click_on "Edit", match: :first

    fill_in "Psk", with: @psk.psk
    click_on "Update Psk"

    assert_text "Psk was successfully updated"
    click_on "Back"
  end

  test "destroying a Psk" do
    visit psks_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Psk was successfully destroyed"
  end
end
