class UserlikepostController < ApplicationController

    def index 

        @userlikepost = Userlikepost.all

        render json: { status: 'Success', message:'load user', data:@userlikepost}, status: :ok

    end

    def create 


        @userlikepostSearch=Userlikepost.where(postp_id: 1, user_id: 1)

        if !@userlikepostSearch.empty? 

            @userlikepostSearch.update(update_params)
                
            render json: { status: 'Success', message:'update successfull', data:@userlikepostSearch}, status: :ok
        else

            @userlikepost = Userlikepost.new(user_likes_post_param)
        
            if @userlikepost.save 
                render json: { status: 'Success', message:'like created', data:@userlikepost}, status: :ok
            else
                render json: { status: 'Error', message:'Error creating like', data:@userlikepost.errors}, status: :unprocessable_entity
            end

        end
   
       

  

    end

    def user_likes_post_param

        params.require(:userlikepost).permit(:user_id,:postp_id,:status)

    end

    def update_params
        params.require(:userlikepost).permit(:status)
      end

end
