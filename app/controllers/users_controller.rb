class UsersController < ApplicationController
  before_action :set_user, only: %i[delete_account]

  def delete_account
    authorize @user
  end


  private

  def set_user
    @user = User.find(current_user.id)
    redirect_to dashboard_path, notice: 'User not found.' if @user.nil?
  end
end
