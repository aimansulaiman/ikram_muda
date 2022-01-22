require "test_helper"

class UmrahCustomersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @umrah_customer = umrah_customers(:one)
  end

  test "should get index" do
    get umrah_customers_url
    assert_response :success
  end

  test "should get new" do
    get new_umrah_customer_url
    assert_response :success
  end

  test "should create umrah_customer" do
    assert_difference('UmrahCustomer.count') do
      post umrah_customers_url, params: { umrah_customer: {  } }
    end

    assert_redirected_to umrah_customer_url(UmrahCustomer.last)
  end

  test "should show umrah_customer" do
    get umrah_customer_url(@umrah_customer)
    assert_response :success
  end

  test "should get edit" do
    get edit_umrah_customer_url(@umrah_customer)
    assert_response :success
  end

  test "should update umrah_customer" do
    patch umrah_customer_url(@umrah_customer), params: { umrah_customer: {  } }
    assert_redirected_to umrah_customer_url(@umrah_customer)
  end

  test "should destroy umrah_customer" do
    assert_difference('UmrahCustomer.count', -1) do
      delete umrah_customer_url(@umrah_customer)
    end

    assert_redirected_to umrah_customers_url
  end
end
