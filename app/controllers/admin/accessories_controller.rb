class Admin::AccessoriesController < Admin::BaseController
  def index
  end

  def new
    @accessory = Accessory.new
  end

  def create
    @accessory = Accessory.create(accessory_params)

    redirect_to bike_shop_path
  end

  private

  def accessory_params
    params.require(:accessory).permit(:title, :description, :thumbnail, :price)
  end
end
