module UmrahCustomersHelper

  def calculate_customers_total_cost(umrah_customer)
    umrah_customer.umrah_package.price.to_i*umrah_customer.total_participants || 0
  end

  def get_total_paid
    @umrah_customer.total_paid.to_s || '0'
  end

  def set_umrah_customer
    @umrah_customer = UmrahCustomer.find(params[:id])
  end
end
