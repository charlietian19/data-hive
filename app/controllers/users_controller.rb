class UsersController < ApplicationController
  def dashboard
    @bookmarkedapps = current_user.research_applications.where(status: 1)
    @submittedapps = current_user.research_applications.where(status: 2)
  end

  def show
  end
end
