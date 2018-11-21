class Api::V1::UsersController < Api::V1::BaseController

  URL = "https://api.weixin.qq.com/sns/jscode2session".freeze

  def wechat_params
    {
      appid: ENV["APP_ID"],
      secret: ENV["APP_SECRET"],
      js_code: params[:code],
      grant_type: "authorization_code"
    }
  end

  def wechat_user
    @wechat_response ||= RestClient.post(URL, wechat_params)
    @wechat_user ||= JSON.parse(@wechat_response.body)
  end

  def login
    @user = User.find_or_create_by(openid: wechat_user.fetch("openid"))
    @user.regenerate_access_token
    render json: {
      access_token: @user.access_token
    }
  end

  def show
  end

  def renting
    @ordered = Order.all.joins(:item).where('items.user_id = ?', params[:id])
  end

  def rentingout
    @orders = @user.orders
  end
end
