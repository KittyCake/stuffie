class ItemsController < ApplicationController
  def index
    @items = Item.all # add only the items that are avaliable for renting
    itemsArray = @items.to_a
    itemsArray.select! do |item|
      item.order.nil?
    end
    render json: {
      items: itemsArray
    }
  end

  def show
    @item = Item.find_by(id: params[:id])
    unless @item.nil?
      render json: {
      item: @item
      }
    else
      render json: {
      error: {
        code: 2,
        message: "Item not found"
      }
    }
    end
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
    # the list of items that i am currently renting

  end

  def rentingout
    # the list of items that i am currently renting out / that i posted
    # the items i have created should go in here
    # testie = User.find_by(access_token: params[:access_token])
    # testie.items
  end

  def update
    # when i click on the edit icon on an item in rentingout i get redirected to the page that is edit and when i click submit it should be changed
  end

  def destroy
    # when you click on delete icon on an item in rentingout i delete it immediate

  end

  private

  def item_params
    params.require(:item).permit(:name, :price)
  end
end
