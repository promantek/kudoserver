class ProfileController < ApplicationController
  def show
    @user = User.find(params[:id])
    redirect_to root_path if @user == current_user
  end
end
