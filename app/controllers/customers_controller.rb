# frozen_string_literal: true

class CustomersController < ApplicationController
  before_action :set_customer, only: %i[ show edit update destroy ]

  def index
    @customers = Customer.where(status: 'active')
  end

  def show
  end

  def new
    @customer = Customer.new
  end

  def edit
  end

  def create
    @customer = Customer.new(customer_params)

    respond_to do |format|
      if @customer.save
        format.html { redirect_to customer_url(@customer), notice: I18n.t(:created_successfully, scope: %i[_dictionary], resource_name: t(:customer, scope: %i[activerecord models], count: 1)) }
        format.json { render :show, status: :created, location: @customer }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @customer.update(customer_params)
        format.html { redirect_to customer_url(@customer), notice: I18n.t(:updated_successfully, scope: %i[_dictionary], resource_name: t(:customer, scope: %i[activerecord models], count: 1)) }
        format.json { render :show, status: :ok, location: @customer }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @customer.destroy

    respond_to do |format|
      format.html { redirect_to customers_url, notice: I18n.t(:destroyed_successfully, scope: %i[_dictionary], resource_name: t(:customer, scope: %i[activerecord models], count: 1)) }
      format.json { head :no_content }
    end
  end

  private

    def set_customer
      @customer = Customer.find(params[:id])
    end

    def customer_params
      params.require(:customer).permit(:name, :matriculation_code, :password, :password_confirmation, :credit, :status)
    end
end
