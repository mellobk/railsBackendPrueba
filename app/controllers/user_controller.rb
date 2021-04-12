class UserController < ApplicationController

    def index 

        @users = User.all

        render json: { status: 'Success', message:'load user', data:@users}, status: :ok

    end

    def create 

        @user = User.new(user_param)
        

        @userFind=User.find_by(email: params[:email])
 
        if @userFind
            render json: { status: 'Success', message:'saved user', data:@userFind}, status: :ok

        else

            if @user.save 
                render json: { status: 'Success', message:'saved user', data:@user}, status: :ok
            else
                render json: { status: 'Error', message:'Error saved user', data:@user.errors}, status: :unprocessable_entity
            end

        end    

    end

    def user_param

        params.permit(:email)

    end

    
end
