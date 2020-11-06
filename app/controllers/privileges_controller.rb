class PrivilegesController < ApplicationController
  def new
    @privilege = Privilege.new
    authorize @privilege
  end

  def create
    @privilege = Privilege.new(privilege_params)
    @privilege.user = current_user
    authorize @privilege
    if @privilege.save
      redirect_to @privilege.project, notice: 'Privilege successfully created.'
    else
      render :new
    end
  end

  private

  def privilege_params
    params.require(:privilege).permit(:admin_id, :project_id)
  end
end
