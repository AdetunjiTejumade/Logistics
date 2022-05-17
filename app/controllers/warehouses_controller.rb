# frozen_string_literal: true

class WarehousesController < ApplicationController
  def new
    @warehouse = Warehouse.new
  end

  def create
    @warehouse = Warehouse.new(warehouse_params)
    if @warehouse.save
      flash[:success] = 'Warehouse successfully created'
      redirect_to @warehouse
    else
      flash[:error] = 'Something went wrong'
      render 'new'
    end
  end

  private

  def set_warehouse
    @warehouse = Warehouse.find(params[:id])
  end

  def warehouse_params
    params.require(:warehouse).permit(:location)
  end
end
