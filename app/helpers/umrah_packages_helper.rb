module UmrahPackagesHelper
  include CostCalculatorConcern

  def calculate_package_price(price,currency)
    render_in_money_terms(price,currency)
  end
end
