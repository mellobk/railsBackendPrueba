class ComentarioController < ApplicationController

    def index 

        @comentary = Comentario.all

        render json: @comentary, status: :ok

    end

    def create 

        @comentary = Comentario.new(user_param)
        
        if @comentary.save 
            render json: { status: 'Success', message:'Comentary created', data:@comentary}, status: :ok
        else
            render json: { status: 'Error', message:'Error create Comentary', data:@comentary.errors}, status: :unprocessable_entity
        end
       

  

    end

    def user_param

        params.require(:comentario).permit(:user_id,:postp_id,:contenido,:nombre)

    end
    
end
