class UsersController < ApplicationController
  def dashboard
    @bookmarkedapps = current_user.research_applications.where(status: 1)
    @submittedapps = current_user.research_applications.where(status: 2)
    @ownedprojectsapp = current_user.research_applications.where(status: 0)
  end

  def show
  end
end
