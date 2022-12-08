# frozen_string_literal: true

# Main controller used for common code
class ApplicationController < ActionController::API
  before_action :user_quota, if: :check_limit?

  def user_quota
    render json: { error: 'over quota' }
  end

  def check_limit?
    current_user.quota_exceded?
  end
end
