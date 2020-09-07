class SessionsController < ApplicationController
    
    def welcome
        
    end

    def destroy
        session.delete(:user_id)
        redirect_to '/'
    end

    def new

    end

    def create
        @user = User.find_by(username: params[:user][:username])
        if @user && @user.authenticate(username: params[:user][:username])
            session[:user_id] = @user.id
            redirect_to user_path(@user) 
        else
            

        end
    end
end