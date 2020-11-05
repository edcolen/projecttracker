class ProjectsController < ApplicationController
  before_action :set_project, only: %i[show]

  def show
    authorize @project
  end

  private

  def set_project
    @project = Project.find_by(id: params[:id])
    redirect_to dashboard_path, notice: 'Project not found.' if @project.nil?
  end
end
