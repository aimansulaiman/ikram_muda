module UmrahCustomersHelper

  def calculate_customers_total_cost(umrah_customer)
    total_package_cost = umrah_customer.umrah_package.price*umrah_customer.total_participants|| 0
    ActionController::Base.helpers.number_to_currency(total_package_cost,:unit => "RM")
  end

  def get_total_paid
    @umrah_customer.total_paid.to_s
  end

  def set_umrah_customer
    @umrah_customer = UmrahCustomer.find(params[:id])
  end
end
