class AccessoriesController < ApplicationController

  def index
    @accessories = Accessory.paginate(page: params[:page], per_page: 12)
  end

  def show
    @accessory = Accessory.find(params[:id])
  end
end
