class UsersController < ApplicationController
  def dashboard
    @bookmarkedapps = current_user.research_applications.where(status: 1)
    @submittedapps = current_user.research_applications.where(status: 2)
    @ownedprojectsapp = current_user.research_applications.where(status: 0)
  end

  def show
  end

  def profile 
    @user = current_user
  end

  def create 
    @user = User.new(user_params)
  end

  def update
    @user = User.find(params[:id])

    if @user.update_attributes(params.require(:user).permit(:firstname, :lastname, :email, :year, :graduation_year, :major, :minor, :gpa, :phone_number))
      flash[:error] = 'The User is successfully updated!'
      redirect_to(user_profile_path(@user))
    end
  end

  def user_params
    params.require(:user).permit(:firstname, :lastname, :email, :password, :year, :graduation_year, :major, :minor, :gpa, :phone_number)
  end
end
