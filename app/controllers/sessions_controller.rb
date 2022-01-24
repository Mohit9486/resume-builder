class SessionsController < ApplicationController
  
    def new
    end
  
    def create
        user = User.find_by(email: params[:session][:email].downcase)
        if user && user.authenticate(params[:session][:password])
            log_in(user)
            redirect_to(root_path)
        else
            flash.now[:danger] = 'Invalid email/password combination'
            render('new')
        end
    end
  


    def signup
        @user = User.new
    end

    def newsignup
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


      def destroy
            log_out
            redirect_to(root_url)
        end
        

      private
        def user_params
          params.require(:user).permit(:name, :email, :password, :password_confirmation)
        end


        

end
