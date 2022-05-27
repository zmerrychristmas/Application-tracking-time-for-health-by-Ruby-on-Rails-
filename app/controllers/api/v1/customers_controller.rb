require 'csv'

class Api::V1::CustomersController < ApplicationController
  before_action :set_customer, only: [:show, :edit, :update, :destroy]

  # GET /customers
  # GET /customers.json
  def index
    @customers = Customer.all.order(id: :asc)
    render json: @customers
  end

  # GET /customers/1
  # GET /customers/1.json
  def show
    if @customer
      render json: @customer
    else
      render json: @customer.errors
    end
  end

  # GET /customers/new
  def new
    @customer = Customer.new
  end

  # GET /customers/1/edit
  def edit
  end

  # POST /customers
  # POST /customers.json
  def create
    @customer = Customer.new(customer_params)

    if @customer.save
      render json: @customer
    else
      render json: @customer.errors
    end
  end

  # PATCH/PUT /customers/1
  # PATCH/PUT /customers/1.json
  def update
    respond_to do |format|
      if @customer.update(customer_params)
        format.html { redirect_to @customer, notice: 'customer was successfully updated.' }
        format.json { render :show, status: :ok, location: @customer }
      else
        format.html { render :edit }
        format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /customers/1
  # DELETE /customers/1.json
  def destroy
    @customer.destroy

    render json: { notice: 'customer was successfully removed.' }
  end

  def import_csv
    file_path = params[:file].path
    parser_method(file_path)
    render json: { notice: 'customer was successfully import' }
  end

  def parser_method(file_path)
    CSV.foreach(file_path, encoding: "iso-8859-1:UTF-8", headers: true) do |row|
       Customer.create!(row.to_hash)
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_customer
      @customer = Customer.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def customer_params
      params.permit(:brand, :style, :country, :quantity)
    end
end