class Api::V1::BaseController < ActionController::Base

  rescue_from StandardError,                with: :internal_server_error
  rescue_from ActiveRecord::RecordNotFound, with: :not_found


  before_action :get_user, except: [:login]
  skip_before_action :verify_authenticity_token

  def get_user
  # params[:access_token] == access_token sent by user
    @user = User.find_by(access_token: params[:access_token])
    if @user.nil?
      render json: {
        error: {
          code: 1,
          message: "Incorrect Access Token"
        }
      }
    end
  end

  private

  def not_found(exception)
    render json: { error: exception.message }, status: :not_found
  end

  def internal_server_error(exception)
    if Rails.env.development?
      response = { type: exception.class.to_s, error: exception.message }
    else
      response = { error: "Internal Server Error" }
    end
    render json: response, status: :internal_server_error
  end
end
