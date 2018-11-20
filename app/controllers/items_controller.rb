class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
  end

  def create
    # @user
    @item = @user.items.new(item_params)
    if @item.save
      render json: {
        item: @item
      }
    else
      render json: {
        error: {
          code: 1,
          message: "Failed"
        }
      }
    end
  end

  def renting

  end

  def rentingout

  end

  def update
  end

  def destroy
  end

  private

  def item_params
    params.require(:item).permit(:name, :price)
  end
end
