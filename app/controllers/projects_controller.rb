class ProjectsController < ApplicationController
  before_action :set_project, only: %i[show]

  def show
    authorize @project
  end

  def new
    @project = Project.new
    authorize @project
  end

  def create
    @project = Project.new(project_params)
    @project.user = current_user
    authorize @project
    if @project.save
      Collaboration.create(user_id: current_user.id, member_id: current_user.id, project_id: @project.id)
      Privilege.create(user_id: current_user.id, admin_id: current_user.id, project_id: @project.id)
      redirect_to @project, notice: 'Project successfully created.'
    else
      render :new
    end
  end

  private

  def project_params
    params.require(:project).permit(:title, :description, :start_date, :end_date)
  end

  def set_project
    @project = Project.find_by(id: params[:id])
    redirect_to dashboard_path, notice: 'Project not found.' if @project.nil?
  end
end
