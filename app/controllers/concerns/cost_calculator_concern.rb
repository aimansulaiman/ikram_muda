module CostCalculatorConcern
  extend ActiveSupport::Concern

  def calculate_customers_total_cost(customer)
    package = customer.umrah_package || Admin::UmrahPackage.first
    total_package_cost = package.price * customer.total_participants
    render_in_money_terms(total_package_cost, "RM")
  end

  # def render_status(status)
  #   status.split("_").map { |status| status.capitalize
  #   }.join(" ")
  # end

  def calculate_total_paid(customer)
    customer.total_paid ||= 0
    total_paid = customer.total_paid.gsub(",", "")
    render_in_money_terms(total_paid, "")
  end

  def render_in_money_terms(cost, currency)
    ActionController::Base.helpers.number_to_currency(cost, :unit => currency)
  end

end
