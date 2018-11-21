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
    @orders = @user.orders
    # the list of items that i am currently renting
    @items = []
    @user.orders.each do |order|
      @items << order.item
    end
    if @user.orders
      render json: {
        items: @items
      }
    else
      render json: {
        error: {
          code: 5,
          message: 'No renting items'
        }
      }
    end
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
    raise
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
    # raise
    # @user = User.find_by(access_token: params[:access_token])
    # @item = @user.items.find(:id)
    # @item.name = item_params[:name]
    # @item.price = item_params[:price]
    # if @item.save
    #   render json: {
    #     item: @item name: "ABC", price: 1234
    #   }
    # else
    #   render json: {
    #     error: {
    #       code: 3,
    #       message: 'No items'
    #     }
    #   }
    # end


  def destroy
    # when you click on delete icon on an item in rentingout i delete it immediate

  end

  private

  def item_params
    params.require(:item).permit(:name, :price)
  end
end
