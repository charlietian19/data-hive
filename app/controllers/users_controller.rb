class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @research_applications = @user.research_applications
    @own_projects = @user.projects
  end
end
