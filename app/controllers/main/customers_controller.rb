# frozen_string_literal: true

class Main::CustomersController < ApplicationController
  before_action :set_customer, only: %i[show]

  def index
    @customers = Customer.where(status: 'active')
  end

  def show
  end

  def new
    @customer = Customer.new
  end

  def create
    @customer = Customer.new(customer_params)

    if @customer.save!
      flash[:success] = I18n.t(:created_successfully, scope: %i[_dictionary], resource_name: I18n.t(:customer, scope: %i[activerecord models], count: 1))
      redirect_to main_customers_path
    else
      render :new
    end
  end

  private

  def customer_params
    params.require(:customer).permit(:name, :matriculation_code, :password, :password_confirmation)
  end

  def set_customer
    @customer = Customer.find(params[:id])
  end
end