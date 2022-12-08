# frozen_string_literal: true

# Carries API related to User Manipulation
class UsersController < ApplicationController
  def data
    @current_user.hits.create(endpoint: 'test.com')
    render json: {
      message: 'Success'
    }, status: :ok
  end
end
