class Api::V1::ItemsController < Api::V1::BaseController
  def index
    # pass all the items that are avaliable for renting
    @items = Item.all
  end

  def show
    @item = Item.find_by(id: params[:id])
  end

  def create
    # @user
    @item = @user.items.new(item_params)
    if @item.save
      render :show, status: :created
    else
      render_error
    end
  end

  def renting
    # the list of items that i am currently renting
    @orders = @user.orders
    @items = @orders.map! { |order| order.item }
  end

  def rentingout
    # the list of items that i am currently renting out / that i posted
    # the items i have created should go in here
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
      render :show
    else
      render_error
    end
  end

  def destroy
    # when you click on delete icon on an item in rentingout i delete it immediate
    @item.destroy
    head :no_content
  end

  private

  def item_params
    params.require(:item).permit(:name, :price, :description)
  end

  def render_error
    render json: { errors: @item.errors.full_messages },
      status: :unprocessable_entity
  end
end
