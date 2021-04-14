class PostpController < ApplicationController

    def index 

        @post = Postp.join('LEFT JOIN "users" ON "users"."id" = "posts"."user_id"')
        render json: { status: 'Success', message:'saved user', data:@post}, status: :ok

    end


    def getallposts 

        @post = Postp.joins('LEFT JOIN "users" ON "users"."id" = "postps"."user_id"').select('users.email','postps.*')
        @likes = Userlikepost.where(user_id: params[:id_user])
        render json: { status: 'Success', message:'saved user', data:@post, likes:@likes}, status: :ok

    end

    def create 

        @postp = Postp.new(postp_param)


        if @postp.save 
            render json: { status: 'Success', message:'saved user', data:@postp}, status: :ok
        else
            render json: { status: 'Error', message:'Error saved user', data:@postp.errors}, status: :unprocessable_entity
        end
        
   

  

    end

    def postp_param

        params.permit(:user_id,:nombre,:contenido,:numero_likes,:numero_dislikes,:numero_comentarios)

    end

end
