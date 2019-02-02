class UsersController < ApplicationController
  before_action :authenticate_user,  only: [:current, :update, :auth]

  def auth
    render json: { success: true, status: 200, message: "You are currently Logged-in as #{current_user.username}" }
  end

  def create
    user = current_class.new(user_params)
    if user.save
      render json: { success: true, status: 200, message: 'User was created!'}
    else
      json_error_response('Create failed', user.errors.messages)
    end
  end

  # Call this method to check if the user is logged-in.
  # If the user is logged-in we will return the user's information.
  def current
    current_user.update!(last_login: Time.now)
    render json: current_user
  end

  def update
    user = current_class.find(params[:id])
    if user.update(user_params)
      render json: { status: 200,
                     message: 'User details have been updated.'
                     user: user
                    }
    else
      json_error_response('Update failed', user.errors.messages)
    end
  end

  private

  def current_class
    User
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end