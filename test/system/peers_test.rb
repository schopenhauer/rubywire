require "application_system_test_case"

class PeersTest < ApplicationSystemTestCase
  setup do
    @peer = peers(:one)
  end

  test "visiting the index" do
    visit peers_url
    assert_selector "h1", text: "Peers"
  end

  test "creating a Peer" do
    visit peers_url
    click_on "New Peer"

    fill_in "Allowed ips", with: @peer.allowed_ips
    fill_in "Dns", with: @peer.dns
    fill_in "Name", with: @peer.name
    click_on "Create Peer"

    assert_text "Peer was successfully created"
    click_on "Back"
  end

  test "updating a Peer" do
    visit peers_url
    click_on "Edit", match: :first

    fill_in "Allowed ips", with: @peer.allowed_ips
    fill_in "Dns", with: @peer.dns
    fill_in "Name", with: @peer.name
    click_on "Update Peer"

    assert_text "Peer was successfully updated"
    click_on "Back"
  end

  test "destroying a Peer" do
    visit peers_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Peer was successfully destroyed"
  end
end
