class PostpController < ApplicationController

    def index 

        @post = Postp.all
 

        render json: @post, status: :ok

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