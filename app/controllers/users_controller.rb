# frozen_string_literal: true

class UsersController < ApplicationController

  def index
    @user = User.available(true)

    render json: @user
  end

  def create
    actor = CreateUserFlow.result(user_params)
    if actor.success?
      render json: actor.user
    else
      render json: actor.error, status: :unprocessable_entity
    end
  end

  def show
    @user = User.find(params[:id])

    render json: @user
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_update_params)
    @user.reload

    render json: @user
  end

  private

  def user_params
    params.permit(:name,
                  :user_name,
                  :email,
                  :birthdate,
                  :vacation,
                  :country_id,
                  { devices: %i[id quantity] })
  end

  def user_update_params
    params.permit(:vacation, :country_id)
  end
end
