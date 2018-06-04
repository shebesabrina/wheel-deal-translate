class Admin::AccessoriesController < Admin::BaseController
  def index
    @accessories = Accessory.paginate(page: params[:page], per_page: 12)
  end

  def new
    @accessory = Accessory.new
  end

  def create
    accessory_params[:thumbnail] = 'https://images.unsplash.com/photo-1503514989573-840194acc714?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=5ab9b6de6c77db8877b2294a2128e2dc&auto=format&fit=crop&w=1951&q=80' if accessory_params[:thumbnail].nil?
    @accessory = Accessory.create(accessory_params)
    if @accessory.save
      redirect_to admin_bike_shop_path
    else
      flash[:notice] = "Accessory #{@accessory.title} already exists. Please fill in fields with valid information."
      render :new
    end
  end

  private

  def accessory_params
    params.require(:accessory).permit(:title, :description, :thumbnail, :price)
  end
end
