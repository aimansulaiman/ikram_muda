module CostCalculatorConcern
  extend ActiveSupport::Concern

  def calculate_customers_total_cost(customer)
    total_package_cost = customer.umrah_package.price * customer.total_participants || 0
    render_in_money_terms(total_package_cost,"RM")
  end

  def calculate_total_paid(customer)
    total_paid = customer.total_paid
    render_in_money_terms(total_paid,"")
  end

  def render_in_money_terms(cost,currency)
    ActionController::Base.helpers.number_to_currency(cost, :unit => currency)
  end

end
