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

  def edit_password
    @user = User.find(params[:user_id])
    if @user.save
      @user.update_attributes(user_params)
      flash[:notice] = 'Your password is successfully updated!'
      redirect_to(user_profile_path(@user))
    end
  end

  def update
    @user = User.find(params[:id])
    filtered_params = params.reject { |_, v| v }

    if @user.save
      @user.update_attributes(user_params)
      flash[:notice] = 'The User is successfully updated!'
      redirect_to(user_profile_path(@user))
    end
  end

  def user_params
    params.require(:user).permit(:firstname, :lastname, :email, :password, :year, :graduation_year, :major, :minor, :gpa, :phone_number)
  end
end
