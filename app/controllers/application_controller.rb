class ApplicationController < ActionController::Base
  before_action :get_user, except: [:login]
  skip_before_action :verify_authenticity_token

  def get_user
  # params[:access_token] == access_token sent by user
    @user = User.find_by(access_token: params[:access_token])
    if @user.nil?
      render json: {
        error: {
          code: 1,
          message: "Failed"
        }
      }
    end
  end
end
