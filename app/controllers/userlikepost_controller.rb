class UserlikepostController < ApplicationController

    def index 

        @userlikepost = Userlikepost.all

        render json: { status: 'Success', message:'load user', data:@userlikepost}, status: :ok

    end

    def create 


        @userlikepostSearch=Userlikepost.where(postp_id:  params[:postp_id], user_id: params[:user_id])
        
        @Post=Postp.where(id: params[:postp_id])
        

        if params[:parametro]==="like"
            @Post.update(numero_likes: @Post[0].numero_likes+params[:like] )
        elsif  params[:parametro]==="likedislike"
            @Post.update(numero_dislikes: @Post[0].numero_dislikes+params[:dislike] )
            @Post.update(numero_likes: @Post[0].numero_likes+params[:like] )
        elsif params[:parametro]==="dislike"
            @Post.update(numero_dislikes: @Post[0].numero_dislikes+params[:dislike] )

        
        end
        
        if !@userlikepostSearch.empty? 

            @userlikepostSearch.update(update_params)
         
                
            render json: { status: 'Success', message:'update successfull', data:@userlikepostSearch}, status: :ok
        else

            @userlikepost = Userlikepost.new(user_likes_post_param)
        
            if @userlikepost.save 
            if params[:status]===1
                @Post=Postp.where(id: params[:postp_id])
                @Post.update(numero_likes: @Post[0].numero_likes+1 )
            else
                @Post.update(numero_dislikes: @Post[0].numero_dislikes+1 )
            end
                render json: { status: 'Success', message:'like created', data:@userlikepost}, status: :ok
            else
                render json: { status: 'Error', message:'Error creating like', data:@userlikepost.errors}, status: :unprocessable_entity
            end

        end
   
       

  

    end

    def user_likes_post_param

        params.permit(:user_id,:postp_id,:status)

    end


    def update_params
        params.permit(:status)
      end

end
