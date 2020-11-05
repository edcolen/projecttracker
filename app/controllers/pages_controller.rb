class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[home]

  def home
    redirect_to(dashboard_path) if current_user
  end

  def dashboard
    @projects = current_user.projects
  end
end
