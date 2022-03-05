require "test_helper"

class UmrahPackagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @umrah_package = umrah_packages(:one)
  end

  test "should get index" do
    get umrah_packages_url
    assert_response :success
  end

  test "should get new" do
    get new_umrah_package_url
    assert_response :success
  end

  test "should create umrah_package" do
    assert_difference('UmrahPackage.count') do
      post umrah_packages_url, params: { umrah_package: {  } }
    end

    assert_redirected_to umrah_package_url(UmrahPackage.last)
  end

  test "should show umrah_package" do
    get umrah_package_url(@umrah_package)
    assert_response :success
  end

  test "should get edit" do
    get edit_umrah_package_url(@umrah_package)
    assert_response :success
  end

  test "should update umrah_package" do
    patch umrah_package_url(@umrah_package), params: { umrah_package: {  } }
    assert_redirected_to umrah_package_url(@umrah_package)
  end

  test "should destroy umrah_package" do
    assert_difference('UmrahPackage.count', -1) do
      delete umrah_package_url(@umrah_package)
    end

    assert_redirected_to umrah_packages_url
  end
end
