class CurrentUserController < ApplicationController
  before_action :authenticate_user!
  def index
    render json: current_user, status: :ok
  end

  def list
    users = User.all
    render json: users, status: :ok
  end
end