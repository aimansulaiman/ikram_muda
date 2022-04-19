class Admin::UmrahCustomersController < ApplicationController
  before_action :set_umrah_customer, only: %i[ show edit update destroy ]

  include CostCalculatorConcern

  # GET /umrah_customers or /umrah_customers.json
  def index
    @umrah_customers = Admin::UmrahCustomer.all
  end

  # GET /umrah_customers/1 or /umrah_customers/1.json
  def show
    update_payment_status
    @umrah_package_price = calculate_customers_total_cost(@umrah_customer)
    @customer_total_paid = calculate_total_paid(@umrah_customer)
    respond_to do |format|
      format.html { render :show, locals: { umrah_customer_params: false } }
    end
  end

  # GET /umrah_customers/new
  def new
    @umrah_customer = Admin::UmrahCustomer.new
    @new_customer = @umrah_customer
  end

  # GET /umrah_customers/1/edit
  def edit
    @umrah_package_price = calculate_customers_total_cost(@umrah_customer)
    @customer_total_paid = calculate_total_paid(@umrah_customer)
  end

  # POST /umrah_customers or /umrah_customers.json
  def create
    @umrah_customer = Admin::UmrahCustomer.new(umrah_customer_params)
    update_payment_status
    respond_to do |format|
      if @umrah_customer.save
        format.html { redirect_to admin_umrah_customers_path, notice: "Umrah customer was successfully created." }
        format.json { render :show, status: :created, location: @umrah_customer }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @umrah_customer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /umrah_customers/1 or /umrah_customers/1.json
  def update
    respond_to do |format|
      if @umrah_customer.update(umrah_customer_params)
        format.html { redirect_to admin_umrah_customer_path(@umrah_customer.id), notice: "Umrah customer was successfully updated." }
        format.json { render :show, status: :ok, location: @umrah_customer }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @umrah_customer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /umrah_customers/1 or /umrah_customers/1.json
  def destroy
    @umrah_customer.destroy

    respond_to do |format|
      format.html { redirect_to admin_umrah_customers_url, notice: "Umrah customer was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # Only allow a list of trusted parameters through.
  def umrah_customer_params
    params
      .require(:admin_umrah_customer)
      .permit(:customer_name,
              :house_tel,
              :home_address,
              :total_participants,
              :date_registered,
              :total_paid,
              :total_cost,
              :flight_inbound_detail_id,
              :flight_outbound_detail_id,
              :quotation_form,
              :registration_form,
              :deposit_payment,
              :final_payment,
              :umrah_package_id,
              :customer_mahram,
              :mobile_tel,
              :customer_waris_name,
              :waris_address,
              :waris_tel,
              :identification_card,
              :gender,
              :citizenship,
              :is_full_payment_made
      )
  end

  def set_umrah_customer
    @umrah_customer = Admin::UmrahCustomer.find(params[:id])
  end

  def update_payment_status
    total_paid_in_money_format = render_in_money_terms(@umrah_customer.total_paid,"")
    total_paid = total_paid_in_money_format.gsub(",","")
    is_full_payment_made = total_paid.to_i - @umrah_customer.umrah_package.price.to_i

    if is_full_payment_made == 0
      @umrah_customer.full_payment!
    elsif is_full_payment_made < 0
      @umrah_customer.partial_payment!
    else
      @umrah_customer.extra_payment!
    end

    @umrah_customer.save
  end

end
