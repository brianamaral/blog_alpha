class UsersController < ApplicationController
    def show
        @user = User.find(user_id)
    end
    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            redirect_to articles_path,success:"User was succesfully created"
        else
            render 'new'
        end
    end

    def edit
        @user = User.find(user_id)
    end

    def update
        @user = User.find(user_id)
        if @user.update user_params
            redirect_to articles_path,message:"Succesfully updated user!"
        else
            render 'new'
        end
        
    end

    private

    def user_params
        params.require(:user).permit(:username,:email,:password)
    end

    def user_id
        params[:id]
    end
end