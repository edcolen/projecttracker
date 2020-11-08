class SectionTeamingsController < ApplicationController
  def new
    @section_teaming = SectionTeaming.new
    authorize @section_teaming
  end

  def create
    @section_teaming = SectionTeaming.new(collaboration_params)
    @section_teaming.user = current_user
    authorize @section_teaming
    if @section_teaming.save
      redirect_to @section_teaming.project, notice: 'Member successfully added.'
    else
      render :new
    end
  end

  private

  def section_teaming_params
    params.require(:section_teaming).permit(:member_id, :section_id)
  end
end
