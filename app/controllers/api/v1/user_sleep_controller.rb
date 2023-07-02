class Api::V1::UserSleepController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user_sleep, only: [:wake_up, :destroy]

  def index
    sleeps = UserSleep.week(current_user.id)
    render json: sleeps, status: :ok
  end

  def sleep_in
    current_time = Time.now()
    date = Date.today
    user_sleep = UserSleep.create(user_id: current_user.id, sleep_in: current_time.to_s, date: date)
    render json: UserSleepSerializer.new(user_sleep), status: :ok
  end

  def wake_up
    @user_sleep.wake_up = Time.now()
    @user_sleep.save
    render json: @user_sleep, status: :ok
  end

  def destroy
    @user_sleep.destroy
    render json: { notice: 'user sleep was successfully removed.' }, status: :ok
  end

  private
  def set_user_sleep
    @user_sleep = UserSleep.where(id: params[:id], user_id: current_user.id).first
    if @user_sleep.nil?
      render :json => {:error => "not-found"}.to_json, :status => 404
    end
  end
end
