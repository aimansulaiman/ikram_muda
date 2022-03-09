class UmrahCustomersController < ApplicationController
  before_action :set_umrah_customer, only: %i[ show edit update destroy ]
  before_action :get_flight_details, only: %i[ show new edit ]
  before_action :get_customer_payment, only: %i[ edit show ]


  # GET /umrah_customers or /umrah_customers.json
  def index
    @umrah_customers = UmrahCustomer.all
  end

  # GET /umrah_customers/1 or /umrah_customers/1.json
  def show
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

  end

  # POST /umrah_customers or /umrah_customers.json
  def create
    @umrah_customer = UmrahCustomer.new(umrah_customer_params)

    respond_to do |format|
      if @umrah_customer.save
        format.html { redirect_to umrah_customer_url(@umrah_customer), notice: "Umrah customer was successfully created." }
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
        format.html { redirect_to umrah_customer_url(@umrah_customer, @flight_inbound_detail), notice: "Umrah customer was successfully updated." }
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
  def set_umrah_customer
    @umrah_customer = UmrahCustomer.find(params[:id])
  end

  def get_flight_details
    @flight_inbound_detail = FlightInboundDetail.all
    @flight_outbound_detail = FlightOutboundDetail.all
  end

  # Only allow a list of trusted parameters through.
  def umrah_customer_params
    params.require(:umrah_customer).permit(:customer_name, :no_tel, :address, :total_participants, :date_registered, :total_paid, :total_cost, :flight_inbound_detail_id, :flight_outbound_detail_id)
  end

  def get_customer_payment
    @customer_total_paid = @umrah_customer.total_paid.to_s || '0'
    @customer_total_cost = @umrah_customer.total_cost.to_s || '0'
  end

end