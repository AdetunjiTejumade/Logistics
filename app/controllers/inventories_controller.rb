# frozen_string_literal: true

# crud
class InventoriesController < ApplicationController
  before_action :set_inventory, only: %i[edit update destroy]

  def index
    @inventories = Inventory.all
    @warehouses = Warehouse.all
  end

  def new
    @inventory = Inventory.new
  end

  def create
    @inventory = Inventory.new(inventory_params)

    if @inventory.save
      redirect_to inventories_path, notice: 'New item was successfully added.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @inventory.update(inventory_params)
      redirect_to inventories_path, notice: 'Item was successfully edited.'
    else
      render :edit
    end
  end

  def destroy
    @inventory.destroy

    redirect_to root_path, notice: 'Item was successfully deleted.'
  end

  private

  def set_inventory
    @inventory = Inventory.find(params[:id])
  end

  def inventory_params
    params.require(:inventory).permit(:item, :quantity, :warehouse_id)
  end
end
