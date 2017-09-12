class UsersController < ApplicationController
  # GET /users
  def index
    @users = User.all
    render json: @users, status: :ok
  end

  # GET /users/:id
  def show
    @user = User.find(params[:id])
    render json: @user, status: :ok
  end

  # POST /user
  def create
    @user = User.create!(user_params)
    render json: @user, status: :created
  end

  # DELETE /users/:id
  def destroy
    User.find(params[:id]).destroy
    head :no_content
  end

  private

  def user_params
    params.permit(:username)
  end
end
