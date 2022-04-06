class UmrahCustomersController < ApplicationController
  before_action :set_umrah_customer, only: %i[ show edit update destroy ]
  before_action :get_flight_details, only: %i[ show new edit update destroy ]
  before_action :get_customer_payment, only: %i[ edit show update destory ]
  before_action :get_umrah_package_detail, only: %i[ new edit show update destory ]

  include UmrahCustomersHelper

  # GET /umrah_customers or /umrah_customers.json
  def index
    @umrah_customers = UmrahCustomer.all
  end

  # GET /umrah_customers/1 or /umrah_customers/1.json
  def show
    @umrah_package_price =  calculate_customers_total_cost(@umrah_customer)
    respond_to do |format|
      format.html { render :show, locals: { umrah_customer_params: false } }
    end
  end

  # GET /umrah_customers/new
  def new
    @umrah_customer = UmrahCustomer.new
    reset_value_payment = '0.00'
    @customer_total_paid = reset_value_payment
    @customer_total_cost = reset_value_payment
    @new_customer = @umrah_customer
  end

  # GET /umrah_customers/1/edit
  def edit
    @umrah_package_price = calculate_customers_total_cost(@umrah_customer)
  end

  # POST /umrah_customers or /umrah_customers.json
  def create
    @umrah_customer = UmrahCustomer.new(umrah_customer_params)

    respond_to do |format|
      if @umrah_customer.save
        format.html { redirect_to umrah_customers_path, notice: "Umrah customer was successfully created." }
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
        format.html { redirect_to umrah_customer_path, notice: "Umrah customer was successfully updated." }
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
      format.html { redirect_to umrah_customers_url, notice: "Umrah customer was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def get_flight_details
    @flight_inbound_detail = FlightInboundDetail.all
    @flight_outbound_detail = FlightOutboundDetail.all
  end

  def get_umrah_package_detail
    @umrah_package = UmrahPackage.all
  end

  # Only allow a list of trusted parameters through.
  def umrah_customer_params
    params.require(:umrah_customer).permit(:customer_name, :house_tel, :home_address, :total_participants, :date_registered, :total_paid, :total_cost, :flight_inbound_detail_id, :flight_outbound_detail_id, :quotation_form, :registration_form, :deposit_payment, :final_payment, :umrah_package_id, :customer_mahram, :mobile_tel, :customer_waris_name, :waris_address, :waris_tel, :identification_card, :gender, :citizenship)
  end

  def get_customer_payment
    @customer_total_paid = get_total_paid
  end

end
