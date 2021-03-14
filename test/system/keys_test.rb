require "application_system_test_case"

class KeysTest < ApplicationSystemTestCase
  setup do
    @key = keys(:one)
  end

  test "visiting the index" do
    visit keys_url
    assert_selector "h1", text: "Keys"
  end

  test "creating a Key" do
    visit keys_url
    click_on "New Key"

    fill_in "Name", with: @key.name
    fill_in "Privatekey", with: @key.privatekey
    fill_in "Publickey", with: @key.publickey
    click_on "Create Key"

    assert_text "Key was successfully created"
    click_on "Back"
  end

  test "updating a Key" do
    visit keys_url
    click_on "Edit", match: :first

    fill_in "Name", with: @key.name
    fill_in "Privatekey", with: @key.privatekey
    fill_in "Publickey", with: @key.publickey
    click_on "Update Key"

    assert_text "Key was successfully updated"
    click_on "Back"
  end

  test "destroying a Key" do
    visit keys_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Key was successfully destroyed"
  end
end
