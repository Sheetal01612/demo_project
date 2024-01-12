class AuthenticationController < ApplicationController
    # before_action :authorize_request, except: :login
  
    def new
    end
  
    def create
      @user = User.find_by(email: params[:user][:email].downcase)
      if @user
        if @user.authenticate(params[:user][:password])
          token = JsonWebToken.encode(user_id: @user.id)
          time = Time.now + 24.hours.to_i
          reset_session
          session[:current_user_id] = @user.id
          case @user.role
          when "buyer"
            redirect_to dashboard_index_path, notice: "Signed in."
          when "seller"
            redirect_to create_category_path
          when "admin"
            # redirect_to dashboard_index_path, notice: "Signed in."
          end
        else
          flash.now[:alert] = "Incorrect email or password."
          render :new, status: :unprocessable_entity
        end
      else
        flash.now[:alert] = "Incorrect email or password."
        render :new, status: :unprocessable_entity
      end
    end
  
    def destroy
      reset_session
      redirect_to root_path
    end
  
    private
  
    def login_params
      params.permit(:email, :password)
    end
  end