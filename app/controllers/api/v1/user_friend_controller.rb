class Api::V1::UserFriendController < ApplicationController
    before_action :authenticate_user!
    before_action :set_friend, only: [:remove]
    def add
        friend = Friend.create(user_id: current_user.id, user_friend_id: params[:user_friend_id])

        if friend.id != nil
            render json: {message: "user friend successfully added!"}, status: :ok
        else
            render json: friend.errors, :status => 400
        end
    end

    def remove
        @friend.destroy
        render json: { message: 'user friend was successfully removed.' }, status: :ok
    end

    private
    def set_friend
        @friend = Friend.where(user_id: current_user.id, user_friend_id: params[:user_friend_id]).first
        if @friend.nil?
          render :json => {:error => "not-found"}.to_json, :status => 404
        end
    end
end
