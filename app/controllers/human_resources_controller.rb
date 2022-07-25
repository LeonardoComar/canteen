# frozen_string_literal: true

class HumanResourcesController < ApplicationController
  before_action :set_human_resource, only: %i[ show edit update destroy ]

  def index
    @human_resources = HumanResource.where(status: 'active')
  end

  def show
  end

  def new
    @human_resource = HumanResource.new
  end

  def edit
  end

  def create
    @human_resource = HumanResource.new(human_resource_params)
    @human_resource.set_default_role!

    respond_to do |format|
      if @human_resource.save
        format.html { redirect_to human_resource_url(@human_resource), notice: I18n.t(:created_successfully, scope: %i[_dictionary], resource_name: t(:human_resource, scope: %i[activerecord models], count: 1)) }
        format.json { render :show, status: :created, location: @human_resource }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @human_resource.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @human_resource.update(human_resource_params)
        format.html { redirect_to human_resource_url(@human_resource), notice: I18n.t(:updated_successfully, scope: %i[_dictionary], resource_name: t(:human_resource, scope: %i[activerecord models], count: 1)) }
        format.json { render :show, status: :ok, location: @human_resource }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @human_resource.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @human_resource.inactive!

    respond_to do |format|
      format.html { redirect_to human_resources_url, notice: I18n.t(:destroyed_successfully, scope: %i[_dictionary], resource_name: t(:human_resource, scope: %i[activerecord models], count: 1)) }
      format.json { head :no_content }
    end
  end

  private

  def set_human_resource
    @human_resource = HumanResource.find(params[:id])
  end

  def human_resource_params
    params.require(:human_resource).permit(:name, :phone, :document, :birth_date)
  end
end
