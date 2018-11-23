class Api::V1::ItemsController < Api::V1::BaseController
  def tagged
    if params[:tag].present?
      @restaurants = Restaurant.tagged_with(params[:tag])
    else
      @restaurants = Restaurant.all
    end
  end

  def index
    # pass all the items that are avaliable for renting
    if params[:user].present?
      @items = Item.where(user_id: params[:user])
    else
      @items = Item.all.order(created_at: :desc)
    end
    #     if params[:query].present?
    #   @movies = Movie.where(title: params[:query])
    # else
    #   @movies = Movie.all
    # end

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
    @item = Item.find_by(id: params[:id])
    if @item.update(item_params)
      render :show
    else
      render_error
    end
  end

  def destroy
    # when you click on delete icon on an item in rentingout i delete it immediate
    @item = Item.find_by(id: params[:id])
    @item.destroy
    head :no_content
  end

  private

  def item_params
    params.require(:item).permit(:name, :price, :description, :tag_list, :image)
  end

  def render_error
    render json: { errors: @item.errors.full_messages },
      status: :unprocessable_entity
  end
end
