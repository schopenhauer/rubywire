require "test_helper"

class PsksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @psk = psks(:one)
  end

  test "should get index" do
    get psks_url
    assert_response :success
  end

  test "should get new" do
    get new_psk_url
    assert_response :success
  end

  test "should create psk" do
    assert_difference('Psk.count') do
      post psks_url, params: { psk: { psk: @psk.psk } }
    end

    assert_redirected_to psk_url(Psk.last)
  end

  test "should show psk" do
    get psk_url(@psk)
    assert_response :success
  end

  test "should get edit" do
    get edit_psk_url(@psk)
    assert_response :success
  end

  test "should update psk" do
    patch psk_url(@psk), params: { psk: { psk: @psk.psk } }
    assert_redirected_to psk_url(@psk)
  end

  test "should destroy psk" do
    assert_difference('Psk.count', -1) do
      delete psk_url(@psk)
    end

    assert_redirected_to psks_url
  end
end
