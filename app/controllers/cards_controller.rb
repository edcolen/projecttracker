class CardsController < ApplicationController
  before_action :set_card, only: %i[show edit update destroy]

  def show
    authorize @card
  end

  def new
    @card = Card.new
    @section = Section.find(params[:section_id])
    authorize @section, :new_card
  end

  def create
    @card = Card.new(card_params)
    @card.user = current_user
    @card.section = Section.find(params[:section_id])
    authorize @card.section, :new_card
    if @card.save
      add_user_as_member unless @card.members.include?(current_user)
      add_user_as_section_member unless @card.section.members.include?(current_user)
      add_leader_as_member unless @card.leader == @card.user && @card.members.include?(@card.leader)
      add_leader_as_section_member unless @card.section.members.include?(@card.leader)
      redirect_to @card.section, notice: 'Card successfully created.'
    else
      render :new
    end
  end

  def edit
    authorize @card
  end

  def update
    authorize @card
    if @card.update(card_params)
      redirect_to @card, notice: 'Card successfully edited.'
    else
      render :edit
    end
  end

  def destroy
    authorize @card
    section = @card.section
    @card.destroy
    redirect_to section_path(section), notice: 'Card was deleted.'
  end

  private

  def card_params
    params.require(:card).permit(:title,
                                 :description,
                                 :start_date,
                                 :end_date,
                                 :leader_id,
                                 :color_id,
                                 :priority,
                                 :status,
                                 :category)
  end

  def set_card
    @card = Card.find_by(id: params[:id])
    redirect_to dashboard_path, notice: 'Card not found.' if @card.nil?
  end

  def add_user_as_member
    CardTeaming.create(user_id: current_user.id,
                       member_id: current_user.id,
                       card_id: @card.id)
  end

  def add_leader_as_member
    CardTeaming.create(user_id: current_user.id,
                       member_id: @card.leader.id,
                       card_id: @card.id)
  end

  def add_user_as_section_member
    SectionTeaming.create(user_id: current_user.id,
                          member_id: current_user.id,
                          section_id: @card.section.id)
  end

  def add_leader_as_section_member
    SectionTeaming.create(user_id: current_user.id,
                          member_id: @card.leader.id,
                          section_id: @card.section.id)
  end
end
