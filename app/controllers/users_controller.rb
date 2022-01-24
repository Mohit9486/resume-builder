class UsersController < ApplicationController
	def new
    @user = User.new
  end

  def create
      updated_user_params = user_params
      @user = User.new(user_params)
      if @user.save
        @user.profile = Profile.new
        flash[:success] = "Signup successfully"
        redirect_to login_path
      else
        flash[:error] = @user.errors.full_messages[0]
        redirect_to signup_path
      end
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end
