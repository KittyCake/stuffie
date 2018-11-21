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
    # @user = User.find_by(access_token: params[:access_token])
    if @user.items
      render json: {
        items: @user.items
      }
    else
      render json: {
        error: {
          code: 3,
          message: 'No items'
        }
      }
    end
  end

  def update
    @item = Item.find_by(id: params[:id])
    if @item.update(item_params)
      render json: {
        item: @item
      }
    else
      render json: {
        error: {
          code: 3,
          message: 'No items'
        }
      }
    end
  end

  def destroy
    @item = Item.find_by(id: params[:id])
    if @item.delete
      render json: {
        item: @item
      }
    else
      render json: {
        error: {
          code: 4,
          message: 'Item was not deleted'
        }
      }
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :price)
  end
end
