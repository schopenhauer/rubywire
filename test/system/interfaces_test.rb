require "application_system_test_case"

class InterfacesTest < ApplicationSystemTestCase
  setup do
    @interface = interfaces(:one)
  end

  test "visiting the index" do
    visit interfaces_url
    assert_selector "h1", text: "Interfaces"
  end

  test "creating a Interface" do
    visit interfaces_url
    click_on "New Interface"

    fill_in "Address", with: @interface.address
    fill_in "Name", with: @interface.name
    fill_in "Port", with: @interface.port
    fill_in "Postdown", with: @interface.postdown
    fill_in "Postup", with: @interface.postup
    fill_in "Privatekey", with: @interface.privatekey
    fill_in "Publickey", with: @interface.publickey
    click_on "Create Interface"

    assert_text "Interface was successfully created"
    click_on "Back"
  end

  test "updating a Interface" do
    visit interfaces_url
    click_on "Edit", match: :first

    fill_in "Address", with: @interface.address
    fill_in "Name", with: @interface.name
    fill_in "Port", with: @interface.port
    fill_in "Postdown", with: @interface.postdown
    fill_in "Postup", with: @interface.postup
    fill_in "Privatekey", with: @interface.privatekey
    fill_in "Publickey", with: @interface.publickey
    click_on "Update Interface"

    assert_text "Interface was successfully updated"
    click_on "Back"
  end

  test "destroying a Interface" do
    visit interfaces_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Interface was successfully destroyed"
  end
end
