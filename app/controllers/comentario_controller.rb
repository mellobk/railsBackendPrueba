class ComentarioController < ApplicationController

    def index 

        @comentary = Comentario.all

        render json: @comentary, status: :ok

    end

    def create 

        @comentary = Comentario.new(user_param)
        @postId = Postp.where(postp_id: params[:postp_id])
        
        if @comentary.save 
            @postId.update(numero_comentarios: @postId[0].numero_comentarios+1 )
            render json: { status: 'Success', message:'Comentary created', data:@comentary}, status: :ok
        else
            render json: { status: 'Error', message:'Error create Comentary', data:@comentary.errors}, status: :unprocessable_entity
        end
       

  

    end

    def user_param

        params.require(:comentario).permit(:user_id,:postp_id,:contenido,:nombre)

    end
    
end
