# frozen_string_literal: true

# Main controller used for common code
class ApplicationController < ActionController::API
  before_action :authorize_request
  before_action :user_quota, if: :check_limit?

  def authorize_request
    header = request.headers['Authorization']
    header = header.split(' ').last if header
    begin
      @decoded = JsonWebToken.decode(header)
      @current_user = User.find(@decoded[:user_id])
    rescue ActiveRecord::RecordNotFound => e
      render json: { errors: e.message }, status: :unauthorized
    rescue JWT::DecodeError => e
      render json: { errors: e.message }, status: :unauthorized
    end
  end
  
  def user_quota
    render json: { error: 'over quota' }
  end

  def check_limit?
    @current_user.quota_exceded?
  end
end
