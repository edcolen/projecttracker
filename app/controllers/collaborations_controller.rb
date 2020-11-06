class CollaborationsController < ApplicationController
  def new
    @collaboration = Collaboration.new
    authorize @collaboration
  end

  def create
    @collaboration = Collaboration.new(collaboration_params)
    @collaboration.user = current_user
    authorize @collaboration
    if @collaboration.save
      redirect_to @collaboration.project, notice: 'Collaboration successfully created.'
    else
      render :new
    end
  end

  private

  def collaboration_params
    params.require(:collaboration).permit(:member_id, :project_id, :role)
  end
end
