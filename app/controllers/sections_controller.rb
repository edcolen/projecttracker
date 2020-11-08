class SectionsController < ApplicationController
  before_action :set_section, only: %i[show edit update destroy]

  # def show
  #   authorize @section
  # end

  def new
    @section = Section.new
    authorize @section
  end

  def create
    @section = Section.new(section_params)
    @section.user = current_user
    @section.project = Project.find(params[:project_id])
    authorize @section
    if @section.save
      redirect_to @section.project, notice: 'Section successfully created.'
    else
      render :new
    end
  end

  # def edit
  #   authorize @section
  # end

  # def update
  #   authorize @section
  #   if @section.update(section_params)
  #     redirect_to @section, notice: 'Section successfully edited.'
  #   else
  #     render :edit
  #   end
  # end

  # def destroy
  #   authorize @section
  #   project = @section.project
  #   @section.destroy
  #   redirect_to project_path(project), notice: 'Section was deleted.'
  # end

  private

  def section_params
    params.require(:section).permit(:title, :description, :start_date, :end_date, :leader_id, :color_id)
  end

  def set_section
    @section = Section.find_by(id: params[:id])
    redirect_to dashboard_path, notice: 'Section not found.' if @section.nil?
  end
end
